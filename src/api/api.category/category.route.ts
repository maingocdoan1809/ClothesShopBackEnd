import Router, { NextFunction, Request, Response } from "express";
import { Database } from "../../db/IDatabase";
import sha256 from "crypto-js/sha256";

const categoryRoute = Router();
type Category = {
  id: string;
  name: string;
  count: number;
};

function getAll(req: Request, res: Response, next: NextFunction) {
  const database = new Database();
  const name = (req.query.name as string) || req.body.name;
  const id = req.params.id;

  database
    .query(
      `Select category.*, count(productinfo.id) as count from category left join productinfo on category.id = productinfo.category ${
        name != undefined
          ? `where lower(category.name) = '${name.toLowerCase()}'`
          : `${id ? `where category.id = '${id}'` : ""}`
      } group by category.id order by count desc`,
      (err, result, fields) => {
        if (err) {
          req.body.err = err;
          next();
        } else {
          req.body.categories = result as Category[];
          next();
        }
      }
    )
    .catch((err) => {
      req.body.err = err;
      next();
    });
}

function requireName(req: Request, res: Response, next: NextFunction) {
  const name = req.body.name;
  if (!name) {
    res.status(406).send({ msg: "Name is required" });
    return;
  }
  next();
}

categoryRoute.get("/:id?", getAll, (req, res) => {
  res.send(req.body.categories);
});
categoryRoute.delete("/:id", getAll, (req, res) => {
  const database = new Database();
  const id = req.params.id;
  const categories = req.body.categories as Category[];
  for (let category of categories) {
    if (category.id == id && category.count != 0) {
      res.status(401).send({ msg: "Cannot delete this  category" });
      return;
    }
  }
  database
    .query(`Delete from category where id = '${id}'`, function (err) {
      if (err) {
        res.status(408).send({ err });
      } else {
        res.status(200).send({ message: "Deleted." });
      }
    })
    .catch((err) => {
      res.status(408).send({ err });
    });
});
categoryRoute.put("/:id", requireName, getAll, (req, res) => {
  if (req.body.err) {
    res.sendStatus(408);
    return;
  }
  const id = req.params.id;
  const newName = req.body.name;
  const database = new Database();
  database
    .query(
      `Update category set name = '${newName}' where id = '${id}'`,
      (err) => {
        if (err) {
          console.log(err);

          res.status(408).send({ err });
        } else {
          res.sendStatus(201);
        }
      }
    )
    .catch((err) => res.status(408).send({ err }));
});
// create
categoryRoute.post("/", requireName, getAll, (req, res) => {
  if (req.body.err) {
    res.sendStatus(408);
    return;
  }
  if (req.body.categories.lenght > 0) {
    res.sendStatus(403);
    return;
  }
  const name = req.body.name;

  const database = new Database();

  database
    .query(
      `Insert into category values('${sha256(
        name + Date.now()
      ).toString()}', '${name}')`,
      (err) => {
        if (err) {
          // Request timeout
          res.status(408).send({ err });
          console.log(err);
        } else {
          // created
          res.sendStatus(201);
        }
      }
    )
    .catch((err) => {
      console.log(err);

      res.status(408).send({ err });
    });
});
export default categoryRoute;

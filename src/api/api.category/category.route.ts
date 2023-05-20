import Router from "express";
import { Database } from "../../db/IDatabase";

const categoryRoute = Router();
type Category = {
  id: string;
  name: string;
  count: number;
};
categoryRoute.get("/", (req, res) => {
  const database = new Database();

  database
    .query(
      `Select category.*, count(productinfo.id) as count from category inner join productinfo where category.id = productinfo.category group by category.id`,
      (err, result, fields) => {
        if (err) {
          res.send({ err });
        } else {
          res.send(result as Category[]);
        }
      }
    )
    .catch((err) => {
      res.send({ err });
    });
});

export default categoryRoute;

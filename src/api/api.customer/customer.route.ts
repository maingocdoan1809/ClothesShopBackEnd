import Router, { NextFunction, Request, Response } from "express";
import { Database } from "../../db/IDatabase";
import sha256 from "crypto-js/sha256";

const customerRoute = Router();

type Customer = {
  id: string;
  username: string;
  phone: string;
  email: string;
  address: string;
  state: boolean;
  priority: number;
};

function getAll(req: Request, res: Response, next: NextFunction) {
  const database = new Database();
  const username = (req.params.username as string) || req.body.username;
  const fullname = req.query.fullname;
  const state = req.query.state;

  database
    .query(
      `Select account.* from account ${
        username != undefined
          ? `where lower(account.username) = '${username.toLowerCase()}'`
          : `${
              fullname && state != undefined
                ? `where account.fullname like N'%${fullname}%' and account.state = '${state}'`
                : `${
                    fullname
                      ? `where account.fullname like N'%${fullname}%'`
                      : `${
                          state != undefined
                            ? `where account.state = '${state}'`
                            : ""
                        }`
                  }`
            }`
      }`,
      (err, result, fields) => {
        if (err) {
          req.body.err = err;
          next();
        } else {
          req.body.customer = result as Customer[];
          next();
        }
      }
    )
    .catch((err) => {
      req.body.err = err;
      next();
    });
}

function requirePriority(req: Request, res: Response, next: NextFunction) {
  const priority = req.body.priority;
  console.log(priority);
  if (priority == undefined) {
    res.status(406).send({ msg: "Priority is required" });
    return;
  }
  next();
}

//Read customer
customerRoute.get("/:username?", getAll, (req, res) => {
  res.send(req.body.customer);
});

//Update customer priority
customerRoute.put("/:username", requirePriority, (req, res) => {
  if (req.body.err) {
    res.sendStatus(408);
    return;
  }
  // chưa handle xem có user đó trong database không.
  const username = req.params.username;
  const newPriority = req.body.priority;
  const database = new Database();

  database
    .query(
      `Update account set priority = '${newPriority}', state = ${
        newPriority == -1 ? 0 : 1
      } where username = '${username}'`,
      (err) => {
        if (err) {
          res.status(408).send({ err });
        } else {
          res.sendStatus(201);
        }
      }
    )
    .catch((err) => res.status(408).send({ err }));
});

export default customerRoute;

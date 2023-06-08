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
    priority: boolean;
  };
  
function getAll(req: Request, res: Response, next: NextFunction) {
    const database = new Database();
    const username = (req.params.username as string) || req.body.username;
    const state = req.query.state;
  
    database
      .query(
        `Select account.* from account ${
          (username != undefined)
            ? `where lower(account.username) = '${username.toLowerCase()}'`
            : `${state ? `where account.state = '${state}'` : ""}`
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
  if (!priority) {
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
customerRoute.put("/:username", requirePriority, getAll, (req, res) => {
  if (req.body.err) {
    res.sendStatus(408);
    return; 
  }
  const username = req.params.username;
  const newPriority = req.body.priority;
  const database = new Database();
  database
    .query(
      `Update account set priority = '${newPriority}' where username = '${username}'`,
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
import { Router } from "express";
import { MySql } from "../../../src/db/mysql/MySql";
import cors from "cors";
import { Database, IDatabase, SQLResult } from "../../db/IDatabase";
import bcrypt from "bcrypt";
import { type } from "os";
import { LoginResult } from "../../db/dbtypes";
const loginRoute = Router();

loginRoute.post("/", (req, res) => {
  let result: LoginResult;
  const username: string = req.body.username || "";
  const hashpassword: string = req.body.password || "";

  const db: IDatabase = new Database();

  if (username == "" || hashpassword == "") {
    result = {
      queryResult: {
        isOk: false,
        message: "Username and password must not be empty.",
      },
      canLogin: false,
      username,
    };
  } else {
    const querystring = `Select * from Account where username = '${username}' and password = '${hashpassword}'`;
    try {
      db.query(querystring, (err, result, fields) => {
        if (err) {
          res.send({
            canLogin: false,
            queryResult: {
              isOk: false,
              message: err.message,
            },
            username,
          } as LoginResult);
        } else {
          res.send({
            canLogin: result.length == 1,
            username,
            queryResult: {
              isOk: true,
            },
          } as LoginResult);
        }
      });
    } catch (err) {
      res.send({
        canLogin: false,
        username,
        queryResult: {
          isOk: true,
        },
      } as LoginResult);
    }
  }
});
export default loginRoute;

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
    const querystring = `Select * from Account`;
    const queryresult = db.query(querystring);
    result = {
      queryResult: queryresult,
      canLogin: queryresult.isOk == true,
      username,
    };
  }
  res.send(result);
});
export default loginRoute;

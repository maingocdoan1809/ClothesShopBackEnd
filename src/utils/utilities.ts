import { MysqlError } from "mysql";
import { Database } from "../db/IDatabase";
import { NextFunction, Response, Request } from "express";

export function checkUserExistence(
  req: Request,
  res: Response,
  next: NextFunction
) {
  const database = new Database(process.env.SQL_STR);
  database.query(
    `Select * from account where username = '${req.params.username}'`,
    (err: MysqlError, result, fields) => {
      if (err) {
        req.body.result = { isExist: undefined };
        next();
      } else {
        req.body.result = { isExist: result.length >= 1 };
        next();
      }
    }
  );
}

import { MysqlError } from "mysql";
import { Database, IDatabase } from "../db/IDatabase";
import { NextFunction, Response, Request } from "express";
import dotenv from "dotenv";
import bcrypt from "bcrypt";
dotenv.config();
export function checkUserExistence(
  req: Request,
  res: Response,
  next: NextFunction
) {
  const database = new Database(process.env.SQL_STR);
  database.query(
    `Select * from account where username = '${
      req.params.username ?? req.body.username
    }'`,

    (err: MysqlError, result, fields) => {
      if (err) {
        req.body.isExist = undefined;
        next();
      } else {
        req.body.isExist = result.length >= 1;
        next();
      }
    }
  );
}
export function updateAccesstime(username: string) {
  const anotherDb: IDatabase = new Database(process.env.SQL_STR);
  anotherDb.query(
    `update account set accesstimes = accesstimes + 1 where username = '${username}'`
  );
}
export function updateHost(username: string, hostname: string) {
  const anotherDb: IDatabase = new Database(process.env.SQL_STR);
  anotherDb.query(
    `update account set host='${hostname}' where username = '${username}'`
  );
}
export async function generateToken() {
  return await bcrypt.hash(
    process.env.TOKEN + new Date().getTime() + Math.random() * 10000,
    Math.random() * 100
  );
}
export function updateToken(username: string, newToken: string) {
  const anotherDb: IDatabase = new Database(process.env.SQL_STR);
  anotherDb.query(
    `update account set token='${newToken}' where username = '${username}'`
  );
}

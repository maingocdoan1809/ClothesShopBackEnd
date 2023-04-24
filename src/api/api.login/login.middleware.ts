import { NextFunction, Request, Response } from "express";
import { Database, IDatabase, SQLResult } from "../../db/IDatabase";
import { LoginResult } from "../../db/dbtypes";
import { sha256 } from "crypto-hash";
export function login(req: Request, res: Response) {
  const isAuthenticated = req.body.isAuthenticated;
  const username: string = req.body.username || "";
  const db: IDatabase = new Database();

  if (isAuthenticated) {
    db.query(
      `update account set accesstimes = accesstimes + 1 where username = ${username}`
    );
    res.send({
      canLogin: true,
      username,
      queryResult: {
        isOk: true,
      },
    } as LoginResult);
  }

  const hashpassword: string = req.body.password || "";

  if (!username || !hashpassword) {
    res.send({
      queryResult: {
        isOk: false,
        message: "Username and password must not be empty.",
      },
      canLogin: false,
    });
  } else {
    const querystring = `Select * from account where username = '${username}' and password = '${hashpassword}'`;
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
          const anotherDb: IDatabase = new Database(process.env.SQL_STR);
          anotherDb.query(
            `update account set accesstimes = accesstimes + 1, host = '${req.hostname}' where username = '${username}'`
          );
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
}

export function authenticateUser(
  req: Request,
  res: Response,
  next: NextFunction
) {
  const database = new Database(process.env.SQL_STR);
  const token = req.headers.token;
  if (!token) {
    next();
    return;
  }
  database.query(
    `Select username from account where host = '${req.hostname}' and token = '${req.headers.token}'`,
    (err, result, fields) => {
      if (err) {
        next();
      } else {
        if (result.length == 1) {
          req.body.isAuthenticated = true;
        }
        next();
      }
    }
  );
}

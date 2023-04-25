import { NextFunction, Request, Response } from "express";
import { Database, IDatabase, SQLResult } from "../../db/IDatabase";
import { LoginResult } from "../../db/dbtypes";
import {
  generateToken,
  updateAccesstime,
  updateHost,
  updateToken,
} from "../../utils/utilities";
export function login(req: Request, res: Response) {
  const isAuthenticated = req.body.isAuthenticated;
  const username: string = req.body.username || "";
  const db: IDatabase = new Database();

  if (isAuthenticated) {
    updateAccesstime(username);
    res.send({
      canLogin: true,
      username,
      queryResult: {
        isOk: true,
      },
      token: req.headers.token,
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
          if (result.length != 1) {
            res.send({
              canLogin: false,
              queryResult: {
                isOk: true,
                message: "Username or password is incorrect.",
              },
            } as LoginResult);
          } else {
            console.log(req.headers.origin);
            generateToken().then((token) => {
              updateToken(username, token);
              updateAccesstime(username);
              updateHost(username, req.headers.origin || "localhost");
              res.send({
                canLogin: true,
                username,
                queryResult: {
                  isOk: true,
                },
                token,
              } as LoginResult);
            });
          }
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
  const host = req.headers.origin || "localhost";
  if (!token) {
    res.send({
      isAuthenticated: false,
    });
  }
  database.query(
    `Select username from account where host = '${req.hostname}' and token = '${req.headers.token}'`,
    (err, result, fields) => {
      if (result.length == 1) {
        res.send({
          isAuthenticated: true,
        });
      }
      res.send({
        isAuthenticated: false,
      });
    }
  );
}

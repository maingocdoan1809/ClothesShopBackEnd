import { NextFunction, Request, Response } from "express";
import { Database, IDatabase, SQLResult } from "../../db/IDatabase";
import {
  LoginResult,
  generateToken,
  updateAccesstime,
  updateHost,
  updateToken,
} from "../../utils/utilities";
import dotenv from "dotenv";
dotenv.config();
export function login(req: Request, res: Response) {
  const username: string = req.body.username;
  const hashpassword: string = req.body.password;

  const db = new Database();

  const querystring = `Select * from account where username = '${username}' and password = '${hashpassword}' and state = 1`;

  db.query(querystring, (err, result, fields) => {
    if (err) {
      res.send({
        // send err to user.
        err,
      });
    } else {
      // if everything works fine.
      if (result.length != 1) {
        res.send({
          isAuthenticated: false,
          message: "Username or password is not correct.",
        });
      } else {
        const origin = req.headers.origin || "localhost";
        const token = generateToken();
        updateToken(username, token);
        updateAccesstime(username);
        updateHost(username, origin);
        const user = result[0];
        res.send({
          isAuthenticated: true,
          token,
          origin,
          username: user.username,
          fullname: user.fullname,
          email: user.email,
          birthday: user.birthday,
          accesstimes: user.accesstimes,
          priority: user.priority,
          phonenumber: user.phonenumber,
          avt: process.env.BACK_END_URL + "/avts/" + user.img,
          address: user.address,
        } as LoginResult);
      }
    }
  }).catch((err) => {
    res.send({ err });
  });
}

export function checkUserInfo(req: Request, res: Response, next: NextFunction) {
  const username: string = req.body.username || "";
  const hashpassword: string = req.body.password || "";
  if (!username || !hashpassword) {
    res.send({
      message: "Username and password must not be empty.",
      isAuthenticated: false,
    });
  } else {
    next();
  }
}

import { Router } from "express";
import { NextFunction, Request, Response } from "express";
import { Database, IDatabase, SQLResult } from "../../db/IDatabase";
import { LoginResult } from "../../utils/utilities";
const authRoute = Router();

export function authenticateUser(req: Request, res: Response) {
  const database = new Database();
  const userid = req.query.username;
  const token = req.query.token;
  const origin = req.headers.origin || "localhost";
  if (!token || !userid) {
    res.send({
      isAuthenticated: false,
    });
    return;
  }
  database
    .query(
      `Select * from account where host = '${origin}' and token = '${token}' and username ='${userid}'`,
      (err, result, fields) => {
        if (err) {
          console.log("inside here");
          res.send({ err: "Connection was lost" });
          return;
        }
        if (result.length == 1) {
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
            avt: user.img,
            phonenumber: user.phonenumber,
            address: user.address,
          } as LoginResult);
        } else {
          res.send({
            isAuthenticated: false,
          });
        }
      }
    )
    .catch((err) => {
      res.send({ err });
    });
}
authRoute.get("/", authenticateUser);

export default authRoute;

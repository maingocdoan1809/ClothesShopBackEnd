import { Router } from "express";
import { NextFunction, Request, Response } from "express";
import { Database, IDatabase, SQLResult } from "../../db/IDatabase";
import { LoginResult } from "../../utils/utilities";
const authRoute = Router();

export function authenticateUser(
  req: Request,
  res: Response,
  next: NextFunction
) {
  const database = new Database();
  const userid = req.query.username;
  const token = req.query.token;
  const origin = req.headers.origin || "localhost";
  if (!token || !userid) {
    req.body.auth = JSON.stringify({
      isAuthenticated: false,
    });
    next();
    return;
  }
  database
    .query(
      `Select * from account where host = '${origin}' and token = '${token}' and username ='${userid}'`,
      (err, result, fields) => {
        if (err) {
          req.body.auth = JSON.stringify({ err: "Connection was lost" });
          next();
          return;
        }
        if (result.length == 1) {
          const user = result[0];
          req.body.auth = JSON.stringify({
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
          next();
        } else {
          req.body.auth = JSON.stringify({
            isAuthenticated: false,
          });
          next();
        }
      }
    )
    .catch((err) => {
      req.body.auth = JSON.stringify({ err });
      next();
    });
}
authRoute.get("/", authenticateUser, (req, res) => {
  res.send(JSON.parse(req.body.auth || {}));
});

export default authRoute;

import { Router } from "express";
import { MySql } from "../../db/mysql/MySql";
import { Database } from "../../db/IDatabase";
import { LoginResult } from "../../utils/utilities";

const usersRoute = Router();

usersRoute.get("/", (req, res) => {
  const database = new Database();
  database
    .query(`Select * from account `, (err, result, fields) => {
      if (err) {
        res.send({ users: [] });
      } else {
        const users = [];
        for (let user of result) {
          users.push({
            username: user.username,
            fullname: user.fullname,
            email: user.email,
            birthday: user.birthday,
            accesstimes: user.accesstimes,
            priority: user.priority,
            address: user.address,
            avt: user.img,
            phonenumber: user.phonenumber,
          } as Partial<LoginResult>);
        }
        res.send({ users: users });
      }
    })
    .catch((err) => {
      res.send({ users: [] });
    });
});

export default usersRoute;

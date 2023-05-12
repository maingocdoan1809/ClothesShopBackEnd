import { Router } from "express";
import { Database } from "../../db/IDatabase";
import { LoginResult } from "../../utils/utilities";
import { authenticateUser } from "../api.auth/auth.route";
import multer from "multer";
import { send } from "process";
const usersRoute = Router();

const storage = multer.diskStorage({
  destination: "public/avts",
  filename: function (req, file, cb) {
    cb(null, "avt_" + req.body.username + ".jpg");
  },
});
const handelFile = multer({
  storage: storage,
});

usersRoute.get("/", authenticateUser, (req, res) => {
  const authResult = JSON.parse(req.body.auth || "{}");
  if (!authResult.isAuthenticated || authResult.priority == 0) {
    res.status(401).send({ message: "unauthorized" });
    return;
  }
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
usersRoute.put("/changepass", authenticateUser, (req, res) => {
  const body = JSON.parse(req.body.auth);
  if (body.isAuthenticated) {
    const username = req.query.username;
    const password = req.body.oldpass;
    const newpassword = req.body.newpass;

    const database = new Database();

    database.query(
      `Update account set password = '${newpassword}' where username = '${username}' and password = '${password}' and token = '${body.token}'`,
      (err, result, fields) => {
        if (err) {
          res.status(500).send({ err: "Something went wrong" });
        } else {
          if (result.affectedRows >= 1) {
            res.send({
              isChange: true,
            });
          } else {
            res.status(401).send({ isChange: false });
          }
        }
      }
    );
  } else {
    res.status(401).send({ isChange: false });
  }
});
usersRoute.put("/edit/:username", handelFile.single("newAvt"), (req, res) => {
  const username = req.params.username;
  const avt = req.file ? req.file.filename : req.body.avt;
  const database = new Database();

  database.query(
    `
    Update account set fullname = '${req.body.fullname}',
    phonenumber = '${req.body.phonenumber}',
    birthday = '${req.body.birthday}',
    address = '${req.body.address}',
    email = '${req.body.email}',
    img = '${avt}'
    where username = '${username}'

  `,
    (err, result, fields) => {
      if (err) {
        res.send({ err });
      } else {
        res.status(200).send({ status: "updated" });
      }
    }
  );
});
export default usersRoute;

import { Router } from "express";
import { Database } from "../../db/IDatabase";
import { LoginResult } from "../../utils/utilities";
import { authenticateUser } from "../api.auth/auth.route";
import multer from "multer";
const usersRoute = Router();

const storage = multer.diskStorage({
  destination: "public/avts",
  filename: function (req, file, cb) {
    console.log(file.filename);

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

usersRoute.put("/:username", handelFile.single("newAvt"), (req, res) => {
  console.log("username: " + req.params.username);

  res.send({ body: req.body });
});
export default usersRoute;

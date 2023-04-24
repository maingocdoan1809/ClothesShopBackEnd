import express from "express";
import http from "http";
import { checkUserExistence } from "../../utils/utilities";
import { Database } from "../../db/IDatabase";
export const registerRoute = express.Router();

registerRoute.post("/", checkUserExistence, (req, res) => {
  const { username, password, isExist } = req.body;
  if (isExist) {
    res.send({ message: "Username exists", hasRegistered: false });
  } else {
    const database = new Database(process.env.SQL_STR);
    database.query(
      `Insert into account(username, password) values('${username}','${password}')`,
      (err, result, fields) => {
        if (err) {
          res.send({
            message: "Register failed",
            hasRegistered: false,
            username,
          });
        } else {
          res.send({
            message: "Register successfully",
            hasRegistered: true,
            username,
          });
        }
      }
    );
  }
});

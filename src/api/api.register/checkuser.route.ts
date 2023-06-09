import express from "express";
import { Database } from "../../db/IDatabase";
import { MysqlError } from "mysql";
import { checkUserExistence } from "../../utils/utilities";
const checkuserRoute = express.Router();

checkuserRoute.get("/:username", checkUserExistence, (req, res) => {
  res.send({
    isExist: req.body.isExist,
  });
});

export default checkuserRoute;

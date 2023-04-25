import { Router } from "express";
import { MySql } from "../../../src/db/mysql/MySql";
import cors from "cors";
import bcrypt from "bcrypt";
import { type } from "os";
import { authenticateUser, checkUserInfo, login } from "./login.middleware";
const loginRoute = Router();

loginRoute.post("/", checkUserInfo, login);
loginRoute.get("/", authenticateUser);

export default loginRoute;

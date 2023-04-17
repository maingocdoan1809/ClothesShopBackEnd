import { Router } from "express";
import { MySql } from "../../../src/db/mysql/MySql";
import cors from "cors";
import bcrypt from "bcrypt";
import { type } from "os";
import { login } from "./login.middleware";
const loginRoute = Router();

loginRoute.post("/", login);
export default loginRoute;

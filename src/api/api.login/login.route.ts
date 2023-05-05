import { Router } from "express";
import { checkUserInfo, login } from "./login.middleware";
const loginRoute = Router();

loginRoute.post("/", checkUserInfo, login);

export default loginRoute;

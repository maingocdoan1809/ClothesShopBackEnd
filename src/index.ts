import express from "express";
import cors from "cors";
import dotenv from "dotenv";
import loginRoute from "../src/api/api.login/login.router";
import getAvatarRoute from "../src/api/api.static/getavatar.router";
import path from "path";
dotenv.config();
import { checkuserRoute } from "./api/api.register/checkuser.route";
import { registerRoute } from "./api/api.register/register.router";
const app = express();

app.use(cors());
app.use(
  express.json({
    type: ["application/json", "text/plain"],
  })
);

app.use("/login", loginRoute);
app.use("/checkuser", checkuserRoute);
app.use("/register", registerRoute);
app.get("/", (req, res) => {
  res.send({ username: "maingocdoan" });
});
app.get(
  "/images/:name",
  express.static(path.join(__dirname, "public")),
  getAvatarRoute
);

app.listen(3000);

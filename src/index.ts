import express from "express";
import cors from "cors";
import dotenv from "dotenv";
import loginRoute from "../src/api/api.login/login.router";
import getAvatarRoute from "../src/api/api.static/getavatar.router";
import path from "path";
dotenv.config();
const app = express();

app.use(cors());
app.use(express.json());
app.use("/login", loginRoute);
app.get("/", (req, res) => {
  res.send({ username: "maingocdoan" });
});
app.get(
  "/:name",
  express.static(path.join(__dirname, "public")),
  getAvatarRoute
);
app.listen(3000);

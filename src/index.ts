import express from "express";
import cors from "cors";
import dotenv from "dotenv";
import loginRoute from "./api/api.login/login.route";
import getAvatarRoute from "./api/api.static/getavatar.route";
import path from "path";
dotenv.config();
import { checkuserRoute } from "./api/api.register/checkuser.route";
import { registerRoute } from "./api/api.register/register.route";
import usersRoute from "./api/api.users/users.route";
import authRoute from "./api/api.auth/auth.route";
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
app.use("/users", usersRoute);
app.use("/auth", authRoute);
app.get(
  "/images/:name",
  express.static(path.join(__dirname, "public")),
  getAvatarRoute
);

app.listen(3000);

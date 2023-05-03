import express from "express";
import cors from "cors";
import dotenv from "dotenv";
import loginRoute from "../src/api/api.login/login.router";
import getAvatarRoute from "../src/api/api.static/getavatar.router";
import path from "path";
dotenv.config();
import { checkuserRoute } from "./api/api.register/checkuser.route";
import { registerRoute } from "./api/api.register/register.router";
import { Server } from "socket.io";
import http from "http";
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
const httpServer = http.createServer(app);
const io = new Server(httpServer, {
  cors: {
    origin: "*",
  },
});

httpServer.listen(3000, () => {
  console.log("Server is listening on port 3000");
});

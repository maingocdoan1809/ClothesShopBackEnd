import express from "express";
import cors from "cors";
import mysql from "mysql";
import dotenv from "dotenv";
import loginRoute from "../src/api/loginapi/login.router";
dotenv.config();
const app = express();

app.use(cors());
app.use(express.json());
app.use("/login", loginRoute);
app.use("/", (req, res) => {
  res.send({ message: "Hello worlddd" });
});

app.listen(3000);

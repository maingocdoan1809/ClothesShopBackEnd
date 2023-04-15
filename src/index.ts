import express from "express";
import cors from "cors";
import mysql from "mysql";
import dotenv from "dotenv";
import loginRoute from "../src/api/loginapi/loginroute";
dotenv.config();
const app = express();

app.use(cors());
app.use(express.json());
app.use("/login", loginRoute);
app.get("/", (req, res) => {
  res.send({ message: "Hello. My name is Doan" });
});

app.listen(3000);

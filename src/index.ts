import express from "express";
import cors from "cors";
import mysql from "mysql";
const app = express();
const connection = mysql.createConnection({
  host: "localhost",
  port: 3306,
  user: "root",
  password: "1234",
});
connection.connect((err) => {
  if (err) {
    console.log("Error");
  }
  console.log("Ok");
});
app.use(cors());
app.get("/", (req, res) => {
  res.send({ message: "Hello." });
});

app.listen(3000);

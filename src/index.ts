import express from "express";
import cors from "cors";
import dotenv from "dotenv";
import loginRoute from "./api/api.login/login.route";

dotenv.config();
import { checkuserRoute } from "./api/api.register/checkuser.route";
import { registerRoute } from "./api/api.register/register.route";
import usersRoute from "./api/api.users/users.route";
import authRoute from "./api/api.auth/auth.route";
import productRouter from "./api/api.product/product.route";
const app = express();

app.use(cors());
app.use(
  express.json({
    type: ["application/json", "text/plain"],
  })
);
app.use(express.static("public"));
app.use("/login", loginRoute);
app.use("/checkuser", checkuserRoute);
app.use("/register", registerRoute);
app.use("/users", usersRoute);
app.use("/auth", authRoute);
app.use("/products", productRouter);
app.listen(3000, () => {
  console.log("App's listening on port 3000");
});

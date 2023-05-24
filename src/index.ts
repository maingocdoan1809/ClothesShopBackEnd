import express from "express";
import cors from "cors";
import dotenv from "dotenv";
import loginRouter from "./api/api.login/login.route";

dotenv.config();
import checkuserRouter from "./api/api.register/checkuser.route";
import registerRouter from "./api/api.register/register.route";
import usersRouter from "./api/api.users/users.route";
import authRouter from "./api/api.auth/auth.route";
import productRouter from "./api/api.product/product.route";
import categoryRouter from "./api/api.category/category.route";
import commentRouter from "./api/api.comment/comment.route";
const app = express();

app.use(cors());
app.use(
  express.json({
    type: ["application/json", "text/plain"],
  })
);
app.use(express.static("public"));

app.use("/login", loginRouter);
app.use("/checkuser", checkuserRouter);
app.use("/register", registerRouter);
app.use("/users", usersRouter);
app.use("/auth", authRouter);
app.use("/products", productRouter);
app.use("/categories", categoryRouter);
app.use("/comments", commentRouter);

app.listen(3000, () => {
  console.log("App's listening on port 3000");
});

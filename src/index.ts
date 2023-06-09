import express from "express";
import http from "http";
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
import checkoutRouter from "./api/api.checkout/checkout.route";
import customerRouter from "./api/api.customer/customer.route";

import io from "socket.io";
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
app.use("/checkout", checkoutRouter);
app.use("/customer", customerRouter)
const PORT = 3000;
const httpServer = http.createServer(app);
const sockerServer = new io.Server(httpServer, {
  cors: {
    origin: "*",
  },
});

httpServer.listen(PORT, () => {
  console.log(`Server is listening on port ${PORT}`);
});

/// socket

sockerServer.on("connection", (server) => {
  server.on("buy", (data: string) => {
    server.broadcast.emit(
      "notify",
      `User ${data} got a new bill, check it out`
    );
  });
});

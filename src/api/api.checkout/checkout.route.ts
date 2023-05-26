import { Router } from "express";
import { authenticateUser } from "../api.auth/auth.route";
import { makeRandomKey } from "../../utils/utilities";
import { Database } from "../../db/IDatabase";
const checkoutRoute = Router();

// checkoutRoute.get("/create", authenticateUser, (req, res) => {
//   const authResult = JSON.parse(req.body.auth);
//   if (authResult.isAuthenticated == false) {
//     res.status(401).send({ err: "Unauthorized" });
//   } else {
//     const username = req.body.username;
//     const billID = makeRandomKey();
//   }
// });

checkoutRoute.get("/", (req, res) => {
  const db = new Database();
});

export default checkoutRoute;

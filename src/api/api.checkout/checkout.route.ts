import { Router } from "express";
import { authenticateUser } from "../api.auth/auth.route";
import { makeRandomKey } from "../../utils/utilities";
import { Database, XQuery } from "../../db/IDatabase";
const checkoutRoute = Router();

// create a bill
checkoutRoute.post("", authenticateUser, (req, res) => {
  const authResult = JSON.parse(req.body.auth);
  if (authResult.isAuthenticated == false) {
    res.status(401).send({ err: "Unauthorized" });
  } else {
    const username = req.body.username;
    const billID = makeRandomKey();
    const { address, email, phonenumber, receiveName } =
      req.body.cart.information;
    const cartItems = req.body.cart.items;
    const cart = req.body.cart;
    if (cartItems.length == 0) {
      res.status(406).send({ msg: "No content in cart list" });
      return;
    }
    const addressStr = `${address.home}, ${address.ward}, ${address.district}, ${address.province}`;

    const database = new Database();
    let sum = 0;

    try {
      for (let item of cartItems) {
        sum +=
          Number.parseInt(item.promotedPrice) * Number.parseInt(item.quantity);
      }
    } catch (err) {
      res.status(500).send({ err });
      return;
    }
    database
      .multipeQueryWithTransaction([
        {
          query: `
    Insert into bill(id, username, receiveaddress, receivephonenumber, receivename) values('${billID}', '${username}', '${addressStr}', '${phonenumber}', '${receiveName}')
    `,
        },
        ...makeCartQueries(billID, cartItems),
        {
          query: `UPDATE bill set totalbill = ${sum} where id = '${billID}'`,
        },
      ])
      .then(() => {
        res.status(201).send({ msg: "Created!" });
      })
      .catch((err) => {
        res.status(500).send({ err });
      });
  }
});

checkoutRoute.get("/", (req, res) => {
  const db = new Database();
});

function makeCartQueries(idBill: string, cart: any) {
  let queries = [] as XQuery[];
  for (let item of cart) {
    queries.push({
      query: `insert into productinbill(idbill, idproduct, actualprice, quantity) values('${idBill}', '${item.id}', '${item.promotedPrice}', '${item.quantity}')`,
    });
  }
  console.log(queries);

  return queries;
}
export default checkoutRoute;

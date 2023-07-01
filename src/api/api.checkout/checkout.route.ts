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

checkoutRoute.get("/:idbill?", (req, res) => {
  const db = new Database();
  const state = req.query.state;
  const idbill = req.params.idbill as string;
  const datecreated = req.query.datecreated;

  db.query(
    `select bill.id, bill.state, sum(productinbill.quantity) as quantity, sum(productinbill.quantity*product.price) as totalamount, bill.datecreated 
    from bill inner join productinbill on bill.id = productinbill.idbill inner join product on productinbill.idproduct = product.id ${
      state && idbill
        ? `where bill.state = '${state}' and bill.id = '${idbill}'`
        : `${
            state && datecreated
              ? `where bill.state = '${state}' and DATE(bill.datecreated) = '${datecreated}'`
              : `${
                  state
                    ? `where bill.state = '${state}'`
                    : `${
                        idbill
                          ? `where bill.id = '${idbill}'`
                          : `${
                              datecreated
                                ? `where DATE(bill.datecreated) = '${datecreated}'`
                                : ""
                            }`
                      }`
                }`
          }`
    } group by bill.id, bill.state, bill.datecreated order by bill.id`,

    (err, data) => {
      if (err) throw err;
      res.send(data);
    }
  );
});

checkoutRoute.get("/:idbill/products", (req, res) => {
  const db = new Database();
  const idbill = req.params.idbill;
  db.query(
    `select product.imageurl, productinfo.name, product.colorname, productinbill.quantity, product.price, bill.datecreated, bill.datedone
    from bill inner join productinbill on bill.id = productinbill.idbill 
    inner join product on productinbill.idproduct = product.id
    inner join productinfo on product.infoid = productinfo.id
            where bill.id = '${idbill}'`,
    (err, data) => {
      if (err) throw err;
      res.send(data);
    }
  );
});

function makeUpdateProductQueries(product) {}

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

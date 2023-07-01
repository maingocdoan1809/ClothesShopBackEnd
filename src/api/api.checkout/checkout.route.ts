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

const ORDERS_PER_PAGE = 8;
checkoutRoute.get("/:idbill?", (req, res) => {
  const db = new Database();
  const state = req.query.state as string;
  const idbill = req.params.idbill as string;
  const datecreated = req.query.datecreated as string;

  const currentPage = parseInt(req.query.page as string) || 0;
  const offset = currentPage * ORDERS_PER_PAGE; 
  db.query(
    `SELECT bill.id, bill.state, SUM(productinbill.quantity) AS quantity, SUM(productinbill.quantity * product.price) AS totalamount, bill.datecreated 
    FROM bill
    INNER JOIN productinbill ON bill.id = productinbill.idbill
    INNER JOIN product ON productinbill.idproduct = product.id
    ${
      state && idbill
        ? `WHERE bill.state = '${state}' AND bill.id = '${idbill}'`
        : state && datecreated
        ? `WHERE bill.state = '${state}' AND DATE(bill.datecreated) = '${datecreated}'`
        : state
        ? `WHERE bill.state = '${state}'`
        : idbill
        ? `WHERE bill.id = '${idbill}'`
        : datecreated
        ? `WHERE DATE(bill.datecreated) = '${datecreated}'`
        : ""
    }
    GROUP BY bill.id, bill.state, bill.datecreated
    ORDER BY bill.datecreated DESC, bill.id
    LIMIT ${ORDERS_PER_PAGE} OFFSET ${offset}`,
    (err, data) => {
      if (err) throw err;
      res.send(data);
    }
  );
});


checkoutRoute.get('/:idbill/products',(req, res)=>{
  const db = new Database();
  const idbill = req.params.idbill;
  db
    .query(`select product.imageurl, productinfo.name, product.colorname, productinbill.quantity, product.price, bill.datecreated, bill.datedone, 
            bill.receivename, bill.receiveaddress, bill.receivephonenumber, account.fullname
            from bill inner join productinbill on bill.id = productinbill.idbill
                      inner join account on bill.username = account.username 
                      inner join product on productinbill.idproduct = product.id
                      inner join productinfo on product.infoid = productinfo.id
            where bill.id = '${idbill}'`, 
    (err, data)=>{
      if(err) throw err;
      res.send(data);
    })
})

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
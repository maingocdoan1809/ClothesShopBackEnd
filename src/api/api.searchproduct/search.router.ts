import Router, { query } from "express";
import { Database } from "../../db/IDatabase";

const PRODUCTS_PER_FETCH = 8;
const searchRouter = Router();

searchRouter.get("/", (req, res) => {
  const page = req.query.page as string;
  let searchName: string;

if (typeof req.query.searchName === "string") {
  searchName = decodeURIComponent(req.query.searchName);
} else {
  res.send({ err: "Invalid searchName parameter" });
  return;
}

  if (!page) {
    res.send({ err: "PAGE NUMBER IS REQUIRED" });
    return;
  }

  const database = new Database();
  database
    .query(
      `SELECT productinfo.*, min(price) AS price, product.imageurl, product.price, sum(product.quantity) AS quantity, category.name AS category, category.id AS categoryid
      FROM productinfo
      INNER JOIN product ON product.infoid = productinfo.id
      INNER JOIN category ON productinfo.category = category.id
      WHERE productinfo.name COLLATE utf8mb4_general_ci LIKE N'%${searchName}%'
      GROUP BY productinfo.id
      LIMIT ${PRODUCTS_PER_FETCH}
      OFFSET ${PRODUCTS_PER_FETCH * Number.parseInt(page)}`,
      (err, result, fields) => {
        if (err) {
          res.send({ err });
        } else {
          res.send(result);
        }
      }
    )
    .catch((err) => {
      res.send({ err });
    });
});

export default searchRouter;



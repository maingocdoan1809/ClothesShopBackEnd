import Router, { query } from "express";
import { Database } from "../../db/IDatabase";
import {
  getIdProduct,
  getQuantityInBill,
  updateQuantity
} from "../../utils/utilities";
const PRODUCTS_PER_FETCH = 5;

const productRouter = Router();

productRouter.post("/", (req, res) => {});

productRouter.get("/", (req, res) => {
  const page = req.query.page as string;
  if (!page) {
    res.send({ err: "PAGE NUMBER IS REQUIRED" });
    return;
  }
  const database = new Database();
  database
    .query(
      `Select productinfo.*, min(price) as price ,product.imageurl, product.price, sum(product.quantity) as quantity, category.name as category, category.id as categoryid from productinfo inner join product on product.infoid = productinfo.id
      inner join category
      on productinfo.category = category.id
       group by productinfo.id Limit ${PRODUCTS_PER_FETCH} offset ${
        PRODUCTS_PER_FETCH * Number.parseInt(page)
      }`,
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

productRouter.get("/search", (req, res) => {
  const database = new Database();
  const category = req.query.category;
  const priceMax = req.query.maxPrice;
  const priceMin = req.query.minPrice;
  const color = req.query.color;
  console.log(color);
  database
    .query(`Select * from product`, (err, result, fields) => {
      if (err) {
        res.send({ err });
      } else {
        res.send(result);
      }
    })
    .catch((err) => {
      res.send({ err });
    });
});
productRouter.get("/:infoid(\\w+|all)", (req, res) => {
  const database = new Database();
  const cmd = req.params.infoid;
  const queryStr = `Select productinfo.*, category.name as category, category.id as categoryid, product.* from product inner join productinfo on product.infoid = productinfo.id inner join category
      on productinfo.category = category.id  where ${
        cmd.toLowerCase() == "all"
          ? true
          : `product.infoid = ${req.params.infoid}`
      }
  `;

  database
    .query(queryStr, (err, result, fields) => {
      if (err) {
        res.send({ err });
      } else {
        res.send(result);
      }
    })
    .catch((err) => {
      res.send({ err });
    });
});

productRouter.put(
  "/:infoid",
  (req, res, next) => {
    const { name, categoryid } = req.body;
    if (name.trim() == "" || categoryid.trim() == "") {
      res
        .status(403)
        .send({ err: "Name and categoryID are required.", updated: false });
      return;
    } else {
      next();
    }
  },
  (req, res) => {
    const infoId = req.params.infoid;
    const { name, categoryid } = req.body;

    const database = new Database();
    database.query(
      `Update productinfo set name = '${name}', category = '${categoryid}' where id = '${infoId}'`,
      (err, result) => {
        if (err) {
          res.status(500).send({ err, updated: false });
        } else {
          res.status(200).send({ updated: true });
        }
      }
    );
  }
);

productRouter.post("/done", async (req, res) => {
  const selectedOrders = req.body.selectedOrders; 
  
  const ids = `('${selectedOrders.join("', '")}')`;

  const database = new Database();
  await database.query(`UPDATE bill SET state = '3' WHERE id IN ${ids}`,
    (err, result) => {}
  );
  for(let i = 0; i < selectedOrders.length; i++)
  {
    let idProduct = await getIdProduct(selectedOrders[i]);
    let quantity = await getQuantityInBill(selectedOrders[i]);
    await updateQuantity(idProduct, quantity);
  }


    return res.status(200).json({
      success: true,
      message: "Thành công",
      content: "Cập nhật thành công"
    });
  }
);

export default productRouter;

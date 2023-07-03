import Router, { query } from "express";
import { Database } from "../../db/IDatabase";

import {
  getIdProduct,
  getQuantityInBill,
  updateProduct,
  updateState,
  getQuantityInProduct,
  getStateBill,
  updateProductCancel
} from "../../utils/utilities";

import { SHA256 } from "crypto-js";

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
try{
  const selectedOrders = req.body.selectedOrders; 

  var billSucess = [];
  var billFail = [];
  for(let i = 0; i < selectedOrders.length; i++)
  {
    let state = await getStateBill(selectedOrders[i]);
    if(state[0].state == 2)
    {
      await updateState(selectedOrders[i], 3, 2);
      billSucess.push(selectedOrders[i]);
    }
    else
    {
      billFail.push(selectedOrders[i]);
    }
  }
    return res.status(200).json({
      success: true,
      message: "Thành công",
      content: "Cập nhật đơn hàng thành công",
      billSucess: billSucess,
      billFail: billFail
    });
  }

catch(err){
  return res.status(500).json({
    success: false,
    message: "Thất bại",
    content: err
  });
}
});

productRouter.post("/transport", async (req, res) => {
  try{
    const selectedOrders = req.body.selectedOrders; 
  
    var billSucess = [];
    var billFail = [];
    for(let i = 0; i < selectedOrders.length; i++)
    {
      let state = await getStateBill(selectedOrders[i]);
      if(state[0].state == 1)
      {
        await updateState(selectedOrders[i], 2, 1);
        billSucess.push(selectedOrders[i]);
      }
      else
      {
        billFail.push(selectedOrders[i]);
      }
    }
      return res.status(200).json({
        success: true,
        message: "Thành công",
        content: "Đang vận chuyển",
        billSucess: billSucess,
        billFail: billFail
      });
    }
  
  catch(err){
    return res.status(500).json({
      success: false,
      message: "Thất bại",
      content: err
    });
  }
  });

productRouter.post("/confirm", async (req, res) => {
  try{
    const selectedOrders = req.body.selectedOrders; 
  
    const database = new Database();
    var billSucess = [];
    var billFail = [];
    for(let i = 0; i < selectedOrders.length; i++)
    {
      let idProduct = await getIdProduct(selectedOrders[i]);
      let bill = await getQuantityInBill(selectedOrders[i]);
      if(typeof(idProduct[0]) == "undefined" || idProduct[0] == '' || typeof(bill[0]) == "undefined" || bill[0] == '' )
      {
        continue;
      }
      else
      {
        let quantityProduct = await getQuantityInProduct(idProduct[0].idproduct);
        //Nếu số sản phẩm còn lại k đủ cho đơn hàng thì chuyển đơn hàng sang trạng thái huỷ
        if(quantityProduct[0].quantity >= bill[0].quantity && bill[0].state == 0)
        {
          await updateProduct(idProduct[0].idproduct, bill[0].quantity);
          await updateState(selectedOrders[i], 1, 0);
          billSucess.push(selectedOrders[i]);
        }
        else
        {
          billFail.push(selectedOrders[i]);
        }
  
      }
    }
      return res.status(200).json({
        success: true,
        message: "Thành công",
        content: "Xác nhận thành công",
        billSucess: billSucess,
        billFail: billFail
      });
    }
  
  catch(err){
    return res.status(500).json({
      success: false,
      message: "Xác nhận thất bại",
      content: err
    });
  }
  });

  productRouter.post("/cancel", async (req, res) => {
    try{
      const selectedOrders = req.body.selectedOrders; 
    
      const database = new Database();
      var billSucess = [];
      var billFail = [];
      for(let i = 0; i < selectedOrders.length; i++)
      {
        let idProduct = await getIdProduct(selectedOrders[i]);
        let bill = await getQuantityInBill(selectedOrders[i]);
        if(typeof(idProduct[0]) == "undefined" || idProduct[0] == '' || typeof(bill[0]) == "undefined" || bill[0] == '' )
        {
          continue;
        }
        else
        {
          if(bill[0].state == 0)
          {
            await updateState(selectedOrders[i], 4, 4);
            billSucess.push(selectedOrders[i]);
          }
          else if (bill[0].state == 4 || bill[0].state == 3)
          {
            billFail.push(selectedOrders[i]);
          }
          else
          {
            await updateProductCancel(idProduct[0].idproduct, bill[0].quantity);
            await updateState(selectedOrders[i], 4, 4);
            billSucess.push(selectedOrders[i]);
          }
        }
      }
        return res.status(200).json({
          success: true,
          message: "Thành công",
          content: "Hủy đơn thành công",
          billSucess: billSucess,
          billFail: billFail
        });
      }
    
    catch(err){
      return res.status(500).json({
        success: false,
        message: "Xác nhận thất bại",
        content: err
      });
    }
    });


productRouter.post("/:productinfo", (req, res) => {
  const infoId = req.params.productinfo;
  const database = new Database();

  res.send(makeUpdateProductQueries(req.body, infoId));
});

export default productRouter;

function makeUpdateProductQueries(info: any, pInfo: string) {
  const queries = [];
  if (info.sizes) {
    for (let i of info.sizes) {
      queries.push(
        `Update products set quantity = ${i.quantity}, price = ${info.price} where id = ${i.productId}`
      );
    }
  }
  if (info.newSizes) {
    for (let i of info.newSizes) {
      const newGeneratedID = SHA256(
        Date.now().toString() + Math.random() + ""
      ).toString();

      queries.push(
        `Insert into products(id, infoid, size, colorcode, colorname, quantity, price, imageurl) values ('${newGeneratedID}', '${pInfo}', '${i.size}', '${info.colorcode}', '${info.colorname}', '${i.quantity}', '${info.price}', '${info.imgUrl}')`
      );
    }
  }
  return queries;
}

import Router from "express";
import { Database } from "../../db/IDatabase";
const commentRoute = Router();

commentRoute.get("/product/:id", (req, res) => {
  const productId = req.params.id;
  const database = new Database();
  database
    .query(
      `Select account.fullname as fullname, comment.datecreated, comment.comment
     from comment 
    inner join account 
    on comment.username = account.username 
    inner join productinfo
    on comment.idproduct = productinfo.id
    where productinfo.id = ${productId}
    `,
      (err, result, fields) => {
        if (err) {
          res.status(404).send({ err });
        }
        res.send(result);
      }
    )
    .catch((err) => {
      res.status(500).send({ err });
    });
});
commentRoute.post("/product/:id", (req, res) => {
  const productId = req.params.id;

  const username = req.body.username || req.query.username;
  const comment = req.body.comment || req.query.comment;
  if (!username || !comment) {
    res.status(406).send({ err: "Username and comment are required." });
    return;
  }
  const database = new Database();
  database
    .query(
      `insert into comment(username,	idproduct,	comment) value('${username}', '${productId}', '${comment}')`,
      (err, result, fields) => {
        if (err) {
          if (err.errno == 1062) {
            res.sendStatus(304);
            return;
          }
          res.send({ err: err });
        } else {
          res.status(200).send({ message: "OK" });
        }
      }
    )
    .catch((err) => {
      res.send({ err });
    });
});
export default commentRoute;

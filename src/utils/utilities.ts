import { MysqlError } from "mysql";
import { Database, IDatabase } from "../db/IDatabase";
import { NextFunction, Response, Request } from "express";
import dotenv from "dotenv";
import { SHA256 } from "crypto-js";
import { type } from "os";
dotenv.config();
export function checkUserExistence(
  req: Request,
  res: Response,
  next: NextFunction
) {
  const database = new Database(process.env.SQL_STR);
  database.query(
    `Select * from account where username = '${
      req.params.username ?? req.body.username
    }'`,

    (err: MysqlError, result, fields) => {
      if (err) {
        req.body.isExist = undefined;
        next();
      } else {
        req.body.isExist = result.length >= 1;
        next();
      }
    }
  );
}
export function updateAccesstime(username: string) {
  const anotherDb: IDatabase = new Database(process.env.SQL_STR);
  anotherDb.query(
    `update account set accesstimes = accesstimes + 1 where username = '${username}'`
  );
}
export function updateHost(username: string, hostname: string) {
  const anotherDb: IDatabase = new Database(process.env.SQL_STR);
  anotherDb.query(
    `update account set host='${hostname}' where username = '${username}'`
  );
}
export function generateToken() {
  return SHA256(
    process.env.TOKEN + new Date().getTime() + Math.random() * 10000
  ).toString();
}
export function updateToken(username: string, newToken: string) {
  const anotherDb: IDatabase = new Database(process.env.SQL_STR);
  anotherDb.query(
    `update account set token='${newToken}' where username = '${username}'`
  );
}
export function makeRandomKey() {
  const str = "abcdefghijklmnopqwrtxyxABCDEFGHIJKLMNOPQRTXYZ";
  let hash = "";
  for (let i = 0; i < 5; i++) {
    const now = Date.now();
    const randomNum = Math.floor(Math.random() * 100); // 0 - 99s
    hash += str[Math.floor(Math.random() * str.length)];
    hash += now % randomNum;
  }
  return hash;
}
export type LoginResult = {
  isAuthenticated: boolean;
  token: string;
  origin: string;
  username: string;
  fullname: string;
  email: string | undefined;
  birthday: string | undefined;
  accesstimes: number;
  priority: number;
  avt: string | undefined;
  phonenumber: string | undefined;
  address: string | undefined;
};

export async function getIdProduct(idBill: string) {
  try{
    const anotherDb: IDatabase = new Database(process.env.SQL_STR);
    const result = await anotherDb.query(
      `SELECT idproduct FROM productinbill JOIN bill On bill.id = productinbill .idbill WHERE idbill = '${idBill}'`,(err, result, fields) => {
        if (err) {
          return ''
        } else {
          return result;
        }
      }
    );
    return result;
  }
  catch(err){
    return [''];
  }
}

export async function getStateBill(idBill: string) {
  try{
    const anotherDb: IDatabase = new Database(process.env.SQL_STR);
    const result = await anotherDb.query(
      `SELECT state FROM productinbill JOIN bill On bill.id = productinbill .idbill WHERE idbill = '${idBill}'`,(err, result, fields) => {
        if (err) {
          return ''
        } else {
          return result;
        }
      }
    );
    return result;
  }
  catch(err){
    return [''];
  }
}

export async function getQuantityInBill(idBill: string) {
  try{
    const anotherDb: IDatabase = new Database(process.env.SQL_STR);
    const result = await anotherDb.query(
      `SELECT quantity, state FROM productinbill JOIN bill On bill.id = productinbill .idbill  WHERE idbill = '${idBill}'`,(err, result, fields) => {
        if (err) {
          return ''
        } else {
          return result;
        }
      }
    );
    return result;
  }
  catch (err) {
    return [''];
  }
}

export async function getQuantityInProduct(idProduct: string) {
  try{
    const anotherDb: IDatabase = new Database(process.env.SQL_STR);
    const result = await anotherDb.query(
      `SELECT quantity FROM product WHERE id = '${idProduct}'`,(err, result, fields) => {
        if (err) {
          return ''
        } else {
          return result;
        }
      }
    );
    return result;
  }
  catch (err) {
    return [''];
  }
}

export async function updateProduct(idProduct: string, quantity: number) {
  const anotherDb: IDatabase = new Database(process.env.SQL_STR);
  await anotherDb.query(
    `UPDATE product
     SET quantity = quantity - ${quantity}, totalbought = totalbought + ${quantity}
     WHERE id = '${idProduct}'`)
}

export async function updateProductCancel(idProduct: string, quantity: number) {
  const anotherDb: IDatabase = new Database(process.env.SQL_STR);
  await anotherDb.query(
    `UPDATE product
     SET quantity = quantity + ${quantity}, totalbought = totalbought - ${quantity}
     WHERE id = '${idProduct}'`)
     
}

export async function updateState(idBill: string, state: number, stateDefault: number) {
  const anotherDb: IDatabase = new Database(process.env.SQL_STR);
  if(stateDefault != 4)
  {
    await anotherDb.query(
      `UPDATE bill
        SET state = '${state}'
        WHERE id = '${idBill}'
        and state = '${stateDefault}'`)
  }
  else
  {
    await anotherDb.query(
      `UPDATE bill
        SET state = '${state}'
        WHERE id = '${idBill}'`)
  }

}

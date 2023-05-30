import mysql from "mysql";
import dotenv from "dotenv";
import { IDatabase, SQLResult, XQuery } from "../IDatabase";
import { resolve } from "dns";
import { rejects } from "assert";

dotenv.config();
export class MySql implements IDatabase {
  private connection: mysql.Connection;
  constructor(connectionStr?: string) {
    this.connection = mysql.createConnection(
      connectionStr || process.env.SQL_STR || "localhost:3306"
    );
  }
  private executeMultiple(
    queries: XQuery[],
    index: number,
    whenAllDone: (...arg) => void,
    whenError: (...arg) => void
  ) {
    if (index == queries.length) {
      this.connection.commit();
      whenAllDone();
      return;
    }
    this.connection.query(queries[index].query, (err, result, fields) => {
      if (err) {
        this.connection.rollback();
        whenError(err);
      } else {
        if (queries[index].handler) {
          queries[index].handler(err, result, fields);
        }
        this.executeMultiple(queries, index + 1, whenAllDone, whenError);
      }
    });
  }
  multipeQueryWithTransaction(queries: XQuery[]) {
    return new Promise((resolve, reject) => {
      // connect to database
      this.connection.connect((err) => {
        // if there is an error, notify it to user
        if (err) {
          reject(err);
        } else {
          // if connected, begin a transaction:
          this.connection.beginTransaction((err) => {
            if (err) {
              // notify user if there's an error
              reject(err);
            } else {
              // begin transaction, now start querying.
              this.executeMultiple(
                queries,
                0,
                () => {
                  resolve("OKKKK");
                },
                (err) => {
                  reject(err);
                }
              );
            }
          });
        }
      });
    });
  }
  /**
   * close the connection
   */
  close() {
    this.connection.end();
  }
  /**
   * Query to database.
   */
  query(queryStr: string, handler: (...arg) => void) {
    return new Promise((resolve, reject) => {
      this.connection.connect((err) => {
        if (err) {
          reject(err);
        } else {
          // do query
          this.connection.query(queryStr, (err, result, fields) => {
            if (handler) {
              handler(err, result, fields);
            }
            resolve(result);
          });
        }
        this.close();
      });
    });
  }
}

import mysql from "mysql";
import dotenv from "dotenv";
import { IDatabase, SQLResult } from "../IDatabase";

dotenv.config();
export class MySql implements IDatabase {
  private connection: mysql.Connection;
  constructor(connectionStr?: string) {
    this.connection = mysql.createConnection(
      connectionStr || process.env.SQL_STR!
    );
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
  query(queryStr: string): SQLResult {
    let result;
    try {
      // try to connect.
      this.connection.connect((err) => {
        if (err) {
          throw err;
        }
        // query
        this.connection.query(queryStr, (err, result, fields) => {
          if (err) {
            throw err;
          } else {
            result = {
              rows: result,
              fields,
            };
          }
        });
      });
    } catch (err) {
      return {
        isOk: false,
        message: err,
      };
    } finally {
      this.close();
    }
    return {
      isOk: true,
      result,
    };
  }
}

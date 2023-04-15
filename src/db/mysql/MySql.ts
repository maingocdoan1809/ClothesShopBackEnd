import mysql from "mysql";
import dotenv from "dotenv";
import { IDatabase, SQLResult } from "../IDatabase";
import { resolve } from "dns";

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
    this.connection.connect((err) => {
      if (err) {
      } else {
        // do query
        this.connection.query(
          queryStr,
          (err: mysql.MysqlError, result, fields: mysql.FieldInfo) => {
            if (err) {
            } else {
            }
            this.close();
          }
        );
      }
    });
    return {
      isOk: true,
      result: {
        rows: [],
        fields: [],
      },
    };
  }
}

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
  query(queryStr: string, handler: (...arg) => void) {
    this.connection.connect((err) => {
      if (err) {
        throw err;
      } else {
        // do query
        this.connection.query(queryStr, handler);
      }
      this.close();
    });
  }
}

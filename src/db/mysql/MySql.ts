import mysql from "mysql";
import dotenv from "dotenv";
import { IDatabase, SQLResult } from "../IDatabase";
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
    return new Promise((resolve, rejects) => {
      this.connection.connect((err) => {
        if (err) {
          rejects(err);
        } else {
          // do query
          this.connection.query(queryStr, handler);
        }
        this.close();
      });
    });
  }
}

import { type } from "os";
import { MySql } from "./mysql/MySql";

export type SQLResult = {
  result?: {
    rows: any[];
    fields: any[];
  };
  isOk: boolean;
  message?: any;
};

export type XQuery = {
  query: string;
  handler?: (...arg: any) => void;
};

export interface IDatabase {
  query: (querystr: string, handler?: (...arg: any) => void) => void;
  multipeQueryWithTransaction(queries: XQuery[], whenAllDone: (...arg) => void);
  close: () => void;
}
export const Database = MySql;

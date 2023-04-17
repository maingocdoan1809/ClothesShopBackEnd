import { MySql } from "./mysql/MySql";

export type SQLResult = {
  result?: {
    rows: any[];
    fields: any[];
  };
  isOk: boolean;
  message?: any;
};

export interface IDatabase {
  query: (querystr: string, handler: (...arg) => void) => void;
  close: () => void;
}
export const Database = MySql;
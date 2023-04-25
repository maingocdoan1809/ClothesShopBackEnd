import { SQLResult } from "./IDatabase";

export type LoginResult = {
  queryResult: SQLResult;
  canLogin: boolean;
  username: string;
  token: string;
};

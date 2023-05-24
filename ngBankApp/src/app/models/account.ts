import { Transaction } from "./transaction";
import { User } from "./user";

export class Account {
  id: number;
  accountType: string;
  accountNumber: number;
  balance: number;
  accountStatus: boolean;
  openedDate: string;
  user: User | null;
  transactions: Transaction[] | null;

  constructor(
    id: number = 0,
    accountType: string = '',
    accountNumber: number = 0,
    balance: number = 0,
    accountStatus: boolean = false,
    openedDate: string = '',
    user: User | null = null,
    transactions: Transaction[] = [],
  ){
    this.id = id;
    this.accountType = accountType;
    this.accountNumber = accountNumber;
    this.balance = balance;
    this.accountStatus = accountStatus;
    this.openedDate = openedDate;
    this.user = user;
    this.transactions = transactions;
  }
}

import { Account } from "./account";
import { Loan } from "./loan";
import { TransactionType } from "./transaction-type";
import { User } from "./user";

export class Transaction {
id: number;
transactionAmount: number;
transactionDate: string;
description: string;
users: User[] | null;
transactionType: TransactionType | null;
loan: Loan | null;
accounts: Account[] | null;

constructor(
  id: number = 0,
  transactionAmount: number = 0,
  transactionDate: string = '',
  description: string = '',
  users: User[] = [],
  transactionType: TransactionType | null = null,
  loan: Loan | null = null,
  accounts: Account[] = [],
){
  this.id = id;
  this.transactionAmount = transactionAmount;
  this.transactionDate = transactionDate;
  this.description = description;
  this.users = users;
  this.transactionType = transactionType;
  this.loan = loan;
  this.accounts = accounts;
}


}

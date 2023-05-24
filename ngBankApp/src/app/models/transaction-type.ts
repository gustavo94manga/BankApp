import { Transaction } from "./transaction";

export class TransactionType {
  id: number;
  payment: number;
  deposit: number;
  withdrawal: number;
  transactions: Transaction[] | null;

  constructor(
    id: number = 0,
    payment: number = 0,
    deposit: number = 0,
    withdrawal: number = 0,
    transactions: Transaction[] = [],
  ){
    this.id = id;
    this.payment = payment;
    this.deposit = deposit;
    this.withdrawal = withdrawal;
    this.transactions = transactions
  }
}

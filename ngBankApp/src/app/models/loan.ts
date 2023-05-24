import { Transaction } from "./transaction";
import { User } from "./user";

export class Loan {
  id: number;
  loanType: string;
  loanAmount: number;
  outstandingAmount: number;
  interestRate: number;
  startDate: string;
  endDate: string;
  transactions: Transaction[] | null;
  user: User | null;

  constructor(
    id: number = 0,
    loanType: string = '',
    loanAmount: number = 0,
    outstandingAmount: number = 0,
    interestRate: number = 0,
    startDate: string = '',
    endDate: string = '',
    transactions: Transaction[] = [],
    user: User | null = null,
  ){
    this.id = id;
    this.loanType = loanType;
    this.loanAmount = loanAmount;
    this.outstandingAmount = outstandingAmount;
    this.interestRate = interestRate;
    this.startDate = startDate;
    this.endDate = endDate;
    this.transactions = transactions;
    this.user = user;
  }
}

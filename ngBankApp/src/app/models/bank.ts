import { BankAddress } from "./bank-address";
import { Employee } from "./employee";
import { User } from "./user";

export class Bank {
  id: number;
  name: string;
  users: User[] | null;
  bankAddress: BankAddress | null;
  employees: Employee[] | null;

  constructor(
    id: number = 0,
  name: string = '',
  users: User[] = [],
  bankAddress: BankAddress | null = null,
  employees: Employee[] = [],
  ){
    this.id = id;
    this.name = name;
    this.users = users;
    this.bankAddress = bankAddress;
    this.employees = employees;
  }
}

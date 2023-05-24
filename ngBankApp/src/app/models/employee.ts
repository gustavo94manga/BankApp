import { Bank } from "./bank";

export class Employee {
  id: number;
  firstName: string;
  lastName: string;
  role: string;
  employeeNumber: number;
  bank: Bank | null;

  constructor(
  id: number = 0,
  firstName: string = '',
  lastName: string = '',
  role: string = '',
  employeeNumber: number = 0,
  bank: Bank | null = null,
  ){
    this.id = id;
    this.firstName = firstName;
    this.lastName = lastName;
    this.role = role;
    this.employeeNumber = employeeNumber;
    this.bank = bank;
  }
}

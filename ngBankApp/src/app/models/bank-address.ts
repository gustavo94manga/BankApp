import { Bank } from "./bank";

export class BankAddress {
  id: number;
  address: string;
  city: string;
  state: string;
  zipCode: string;
  bank: Bank | null;

  constructor(
    id: number = 0,
    address: string = '',
    city: string = '',
    state: string = '',
    zipCode: string = '',
    bank: Bank | null = null,
  ){
    this.id = id;
    this.address = address;
    this.city = city;
    this.state = state;
    this.zipCode = zipCode;
    this.bank = bank;
  }
}

import { User } from "./user";

export class UserAddress {
  id: number;
  address: string;
  city: string;
  state: string;
  zipCode: string;
  user: User | null;

  constructor(
    id: number = 0,
    address: string = '',
    city: string = '',
    state: string = '',
    zipCode: string = '',
    user: User | null = null,
  ){
    this.id = id;
    this.address = address;
    this.city = city;
    this.state = state;
    this.zipCode = zipCode;
    this.user = user;
  }
}

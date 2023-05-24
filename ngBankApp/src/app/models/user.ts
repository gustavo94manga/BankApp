import { Bank } from "./bank";
import { Loan } from "./loan";
import { Transaction } from "./transaction";
import { UserAddress } from "./user-address";
import { UserDetail } from "./user-detail";

export class User {
  id: number;
  email: string;
  username: string;
  password: string;
  phone: string;
  lastLogin: string;
  enabled: boolean;
  userAccounts: any[] | null;
  userDetail: UserDetail | null;
  userAddress: UserAddress | null;
  transactions: Transaction[] | null;
  banks: Bank[] | null;
  loans: Loan[] | null;

  constructor(
    id: number = 0,
    email: string = '',
    username: string = '',
    password: string = '',
    phone: string = '',
    lastLogin: string = '',
    enabled: boolean = false,
    userAccounts: any[] = [],
    userDetail: UserDetail | null = null,
    userAddress: UserAddress | null = null,
    transactions: Transaction[] = [],
    banks: Bank[] = [],
    loans: Loan[] = [],
  ){
    this.id = id;
    this.email = email;
    this.username = username;
    this.password = password;
    this.phone = phone;
    this.lastLogin = lastLogin;
    this.enabled = enabled;
    this.userAccounts = userAccounts;
    this.userDetail = userDetail;
    this.userAddress = userAddress;
    this.transactions = transactions;
    this.banks = banks;
    this.loans = loans;
  }

}

import { Component } from '@angular/core';
import { Transaction } from 'src/app/models/transaction';
import { User } from 'src/app/models/user';
import { UserDetail } from 'src/app/models/user-detail';

@Component({
  selector: 'app-user-account',
  templateUrl: './user-account.component.html',
  styleUrls: ['./user-account.component.css']
})
export class UserAccountComponent {
user: User = new User();
selected: User | null = null;
username: string = '';
editUser: User | null = null;
userDetail: UserDetail | null = null;
transaction: Transaction | null = null;
createTransaction: boolean = false;
checkedUser: boolean = false;

ngOnInit(): void {

}

}

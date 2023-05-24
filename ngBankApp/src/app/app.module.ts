import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { FormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { BankComponent } from './components/bank/bank.component';
import { LoanComponent } from './components/loan/loan.component';
import { UserDetailComponent } from './components/user-detail/user-detail.component';
import { UserAddressComponent } from './components/user-address/user-address.component';
import { TransactionComponent } from './components/transaction/transaction.component';
import { TransactionTypeComponent } from './components/transaction-type/transaction-type.component';
import { AccountComponent } from './components/account/account.component';
import { BankAddressComponent } from './components/bank-address/bank-address.component';
import { EmployeeComponent } from './components/employee/employee.component';
import { HomeComponent } from './components/home/home.component';
import { NavbarComponent } from './components/navbar/navbar.component';


@NgModule({
  declarations: [
    AppComponent,
    BankComponent,
    LoanComponent,
    UserDetailComponent,
    UserAddressComponent,
    TransactionComponent,
    TransactionTypeComponent,
    AccountComponent,
    BankAddressComponent,
    EmployeeComponent,
    HomeComponent,
    NavbarComponent
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    HttpClientModule
  ],
  providers: [],
  bootstrap: [AppComponent]
})
export class AppModule { }

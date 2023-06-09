import { NgModule } from '@angular/core';
import { BrowserModule } from '@angular/platform-browser';

import { AppRoutingModule } from './app-routing.module';
import { AppComponent } from './app.component';
import { FormsModule } from '@angular/forms';
import { HttpClientModule } from '@angular/common/http';
import { BankComponent } from './components/bank/bank.component';
import { LoanComponent } from './components/loan/loan.component';
import { UserAddressComponent } from './components/user-address/user-address.component';
import { TransactionComponent } from './components/transaction/transaction.component';
import { TransactionTypeComponent } from './components/transaction-type/transaction-type.component';
import { AccountComponent } from './components/account/account.component';
import { BankAddressComponent } from './components/bank-address/bank-address.component';
import { EmployeeComponent } from './components/employee/employee.component';
import { HomeComponent } from './components/home/home.component';
import { NavbarComponent } from './components/navbar/navbar.component';
import { NgbModule } from '@ng-bootstrap/ng-bootstrap';
import { UserAccountComponent } from './components/user-account/user-account.component';
import { RegistrationComponent } from './components/registration/registration.component';
import { LoginComponent } from './components/login/login.component';
import { LogoutComponent } from './components/logout/logout.component';

@NgModule({
  declarations: [
    AppComponent,
    BankComponent,
    LoanComponent,
    UserAddressComponent,
    TransactionComponent,
    TransactionTypeComponent,
    AccountComponent,
    BankAddressComponent,
    EmployeeComponent,
    HomeComponent,
    NavbarComponent,
    UserAccountComponent,
    RegistrationComponent,
    LoginComponent,
    LogoutComponent,
  ],
  imports: [
    BrowserModule,
    AppRoutingModule,
    FormsModule,
    HttpClientModule,
    NgbModule,
  ],
  providers: [],
  bootstrap: [AppComponent],
})
export class AppModule {}

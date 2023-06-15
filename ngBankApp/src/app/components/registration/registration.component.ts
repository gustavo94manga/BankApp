import { UserAddress } from './../../models/user-address';
import { Component } from '@angular/core';
import { FormBuilder, FormGroup } from '@angular/forms';
import { HttpClient } from '@angular/common/http';
import { Router } from '@angular/router';
import { catchError } from 'rxjs/operators';
import { of } from 'rxjs';
import { User } from 'src/app/models/user';
import { UserDetail } from 'src/app/models/user-detail';
import { AuthService } from 'src/app/services/auth.service';

@Component({
  selector: 'app-registration',
  templateUrl: './registration.component.html',
  styleUrls: ['./registration.component.css']
})
export class RegistrationComponent {
  registerForm: FormGroup;
  user: User = {
    email: '',
    username: '',
    password: '',
    phone: '',
    userAddress: {
      address: '',
      city: '',
      state: '',
      zipCode: ''
    },
    userDetail: {
      firstName: '',
      lastName: '',
      dateOfBirth: ''
    },
    enabled: true
  };

  constructor(
    private formBuilder: FormBuilder,
    private http: HttpClient,
    private router: Router,
    private auth: AuthService,

  ) {
    this.registerForm = this.formBuilder.group({
      username: '',
      password: ''
    });
  }

  // register(){
  //   const username = this.registerForm.get('username')?.value;
  //   const password = this.registerForm.get('password')?.value;

  //   this.http.post('api/register', this.user)
  //     .pipe(
  //       catchError(error => {
  //         console.error('Registration failed:', error);
  //         return of(null);
  //       })
  //     )
  //     .subscribe(response => {
  //       if (response) {
  //         this.router.navigate(['/login']);
  //       }
  //     });
  // }

  register(user: User): void {

    console.log('Registering user:');

    this.auth.register(user).subscribe({
      next: (registeredUser) => {
        this.auth.login(user.username, user.password).subscribe({
          next: (loggedInUser) => {
            console.log(loggedInUser);

            this.router.navigateByUrl('/home');

          },
          error: (problem) => {
            console.error('RegisterComponent.register(): Error logging in user:');
            console.error(problem);
          }
        });
      },
      error: (fail) => {
        console.error('RegisterComponent.register(): Error registering account');
        console.error(fail);
      }
    });

  }
}

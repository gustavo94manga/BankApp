import { Component } from '@angular/core';
import { FormBuilder, FormGroup } from '@angular/forms';
import { HttpClient } from '@angular/common/http';
import { Router } from '@angular/router';
import { catchError } from 'rxjs/operators';
import { of } from 'rxjs';
import { User } from 'src/app/models/user';

@Component({
  selector: 'app-registration',
  templateUrl: './registration.component.html',
  styleUrls: ['./registration.component.css']
})
export class RegistrationComponent {
  registerForm: FormGroup;
  user: User = new User();

  constructor(
    private formBuilder: FormBuilder,
    private http: HttpClient,
    private router: Router
  ) {
    this.registerForm = this.formBuilder.group({
      username: '',
      password: ''
    });
  }

  register() {
    const username = this.registerForm.get('username')?.value;
    const password = this.registerForm.get('password')?.value;

    this.http.post('/register', { username, password })
      .pipe(
        catchError(error => {
          console.error('Registration failed:', error);
          return of(null);
        })
      )
      .subscribe(response => {
        if (response) {
          this.router.navigate(['/login']);
        }
      });
  }
}

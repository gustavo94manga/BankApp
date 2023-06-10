import { HttpClient } from '@angular/common/http';
import { Component } from '@angular/core';
import { FormControl, FormGroup, Validators } from '@angular/forms';
import { catchError, throwError } from 'rxjs';

@Component({
  selector: 'app-registration',
  templateUrl: './registration.component.html',
  styleUrls: ['./registration.component.css']
})
export class RegistrationComponent {
  constructor(private http: HttpClient){}

  registrationForm = new FormGroup({
    email: new FormControl('', [Validators.required, Validators.email]),
    password: new FormControl('', [Validators.required, Validators.minLength(8)]),
  });


  onSubmit(): void {
    if (this.registrationForm.valid) {
      this.http.post('http://localhost:8088/api/regiser', this.registrationForm.value).subscribe({
        next: (response) => console.log(response),
        error: (error) => console.log(error)
      });
    } else {
      console.log('Form is not valid');
    }
  }




}

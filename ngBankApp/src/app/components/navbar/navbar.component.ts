import { Component } from '@angular/core';
import { Router } from '@angular/router';
import { NgbModal } from '@ng-bootstrap/ng-bootstrap';
import { AuthService } from 'src/app/services/auth.service';

@Component({
  selector: 'app-navbar',
  templateUrl: './navbar.component.html',
  styleUrls: ['./navbar.component.css']
})
export class NavbarComponent {
  isCollapsed = false;

  constructor(private modalService: NgbModal,
     private auth: AuthService,
     private router: Router
     ) {}

  showSignupModal() {
    //  this.modalService.open(SignupComponent)

      this.router.navigate(['/login']);


  }
  home() {
    this.router.navigateByUrl('/home');
  }

  loggedIn(): boolean {
    return this.auth.checkLogin();
  }

  logout() {
    console.log('Logging out.');
    this.auth.logout();
    this.router.navigateByUrl('/home');
  }
}

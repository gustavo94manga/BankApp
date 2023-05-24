import { ComponentFixture, TestBed } from '@angular/core/testing';

import { BankAddressComponent } from './bank-address.component';

describe('BankAddressComponent', () => {
  let component: BankAddressComponent;
  let fixture: ComponentFixture<BankAddressComponent>;

  beforeEach(async () => {
    await TestBed.configureTestingModule({
      declarations: [ BankAddressComponent ]
    })
    .compileComponents();

    fixture = TestBed.createComponent(BankAddressComponent);
    component = fixture.componentInstance;
    fixture.detectChanges();
  });

  it('should create', () => {
    expect(component).toBeTruthy();
  });
});

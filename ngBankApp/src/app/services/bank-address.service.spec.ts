import { TestBed } from '@angular/core/testing';

import { BankAddressService } from './bank-address.service';

describe('BankAddressService', () => {
  let service: BankAddressService;

  beforeEach(() => {
    TestBed.configureTestingModule({});
    service = TestBed.inject(BankAddressService);
  });

  it('should be created', () => {
    expect(service).toBeTruthy();
  });
});

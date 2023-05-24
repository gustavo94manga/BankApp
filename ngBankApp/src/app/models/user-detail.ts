export class UserDetail {
  id: number;
  firstName: string;
  lastName: string;
  dateOfBirth: string;

  constructor(
    id: number = 0,
    firstName: string = '',
    lastName: string = '',
    dateOfBirth: string = ''
  ) {
    this.id = id;
    this.firstName = firstName;
    this.lastName = lastName;
    this.dateOfBirth = dateOfBirth;
  }
}

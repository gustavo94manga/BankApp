export class UserDetail {
  id?: number | null;
  firstName: string | null;
  lastName: string | null;
  dateOfBirth: string | null;

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

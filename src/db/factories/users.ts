import { faker } from '@faker-js/faker';
import { getCreatedOrUpdatedAt } from './utilities';

const userTypes = [
  'partner_md_rad',
  'partner_omr_rad',
  'partner_manager',
  'customer_dentist',
  'customer_sync',
  'customer_patient',
  'customer_manager',
  'company_admin',
  'company_developer',
  'company_executive',
]

export const fakeUser = (): any => ({
  type: faker.helpers.arrayElement(userTypes),
  username: faker.person.fullName(),
  firstName: faker.person.firstName(),
  lastName: faker.person.lastName(),
  email: faker.internet.email(),
  password: faker.internet.password(),
  countryCode: faker.number.int({ min: 1, max: 998 }),
  phoneNumber: faker.number.int({ min: 582494, max: 238538149023 }),
  birthDate: faker.date.birthdate(),
  createdAt: getCreatedOrUpdatedAt(),
  updatedAt: getCreatedOrUpdatedAt(),
})
import { faker } from '@faker-js/faker';
import { fisherYatesShuffler, getCreatedOrUpdatedAt } from './utilities';
import { countryCodeFormats } from '@/api/utilities';

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
];

const statusTypes = [
  'active',
  'paused',
  'offboarded'
];

export const fakeUser = (): any => {
  const firstName = faker.person.firstName();
  const lastName = faker.person.lastName();
  const specialCharacters = ['_', '-', '!', '@', '#', '$', '%', '^', '&', '*'];
  const singleSpecialChar = specialCharacters[Math.floor(Math.random() * specialCharacters.length)];
  const lowerFirstName = firstName.toLowerCase();
  const lowerLastName = lastName.toLowerCase();
  const { isoTwo, code, name, format } = faker.helpers.arrayElement(countryCodeFormats);
  const phoneNumRange = format.replaceAll(' ', '').length;
  const min = Math.pow(10, phoneNumRange - 1);
  const max = Math.pow(10, phoneNumRange) - 1;

  const usernameParams = [
    lowerFirstName,
    lowerLastName,
    singleSpecialChar,
    faker.number.int({ min: 0, max: 9999 })
  ];

  return {
    firstName,
    lastName,
    status: faker.helpers.arrayElement(statusTypes),
    type: faker.helpers.arrayElement(userTypes),
    username: fisherYatesShuffler(usernameParams).join(''),
    email: faker.internet.email({ firstName, lastName }),
    password: faker.internet.password(),
    country: name,
    countryISO: isoTwo,
    countryCode: code,
    phoneNumber: faker.number.int({ min, max }),
    birthDate: faker.date.birthdate(),
    createdAt: getCreatedOrUpdatedAt(),
    updatedAt: getCreatedOrUpdatedAt(),
  }
};
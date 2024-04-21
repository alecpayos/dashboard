import { faker } from '@faker-js/faker'
import { RelationId } from '../types'

import {
  cbctModels,
  imageViewingSoftwares,
  managemenetSoftwares
} from '../definitions';

import {
  getCreatedOrUpdatedAt,
  getRandomBoolean,
  getRandomMacAddress,
  getRandomSyncVersion,
  getWatchedDirectory
} from './utilities';

export const fakeOffice = (userIdList: RelationId[]): any => {
  const activeStatus = faker.number.int({ min: 0, max: 4 })
  const createdOrUpdatedAt = getCreatedOrUpdatedAt()

  return {
    activeState: activeStatus,
    onboardStatus: getRandomBoolean(),
    name: faker.company.name(),
    addressOne: faker.location.streetAddress(),
    addressTwo: faker.location.secondaryAddress(),
    city: faker.location.city(),
    state: faker.location.state(),
    zipcode: parseInt(faker.location.zipCode()),
    phoneNumber: faker.number.int({ min: 582494, max: 238538149023 }),
    notes: faker.word.words({ count: { min: 15, max: 30 } }),
    mdPricePerScan: faker.number.int({ min: 20, max: 120 }),
    omrPricePerScan: faker.number.int({ min: 20, max: 120 }),
    reportCredits: faker.number.int({ min: 0, max: 20 }),
    cancelledAt: !activeStatus ? faker.date.past() : null,
    statusChangeReason: faker.word.words({ count: { min: 15, max: 30 } }),
    scanAcquisitionStyle: faker.number.int({ min: 0, max: 4 }),
    createdAt: createdOrUpdatedAt,
    updatedAt: createdOrUpdatedAt,
    users: { connect: faker.helpers.arrayElements(userIdList, { min: 1, max: 5 }) },
    syncSettings: { create: fakeOfficeSync(createdOrUpdatedAt) },
    acquisitionMachine: { create: fakeOfficeMachine(createdOrUpdatedAt) },
    smartDismissSettings: { create: fakeSmartDismiss(createdOrUpdatedAt) },
  }
};

export const fakeOfficeSync = (createdOrUpdatedAt: Date): any => ({
  syncVersion: getRandomSyncVersion(),
  syncWatchDirectory: getWatchedDirectory(),
  createdAt: createdOrUpdatedAt,
  updatedAt: createdOrUpdatedAt,
});

export const fakeOfficeMachine = (createdOrUpdatedAt: Date): any => ({
  managementSoftware: faker.helpers.arrayElement(managemenetSoftwares),
  cbctModel: faker.helpers.arrayElement(cbctModels),
  viewingSoftware: faker.helpers.arrayElement(imageViewingSoftwares),
  desktopHostname: faker.person.fullName(),
  desktopMacAddress: getRandomMacAddress(),
  desktopRemoteAccess: faker.word.words({ count: { min: 2, max: 5 } }),
  desktopLastAccessed: faker.date.past(),
  createdAt: createdOrUpdatedAt,
  updatedAt: createdOrUpdatedAt,
});

export const fakeSmartDismiss = (createdOrUpdatedAt: Date): any => ({
  modalities: 'PX,XA,ES',
  officeCalibration: getRandomBoolean(),
  blurryScans: getRandomBoolean(),
  companyCalibration: getRandomBoolean(),
  ageRestrictions: faker.number.int({ min: 1, max: 18 }),
  postOp: faker.helpers.arrayElement([3,6,12]),
  fovRestrictions: 1,
  createdAt: createdOrUpdatedAt,
  updatedAt: createdOrUpdatedAt,
});
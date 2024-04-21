import { faker } from "@faker-js/faker"
import { RelationId } from "../types"
import { getCreatedOrUpdatedAt, getRandomBoolean } from "./utilities"
import { fakeMedia } from "./medias"
import { fakeScanDismiss } from "./scanDismiss"

export const fakeScan = (
  officeIds: RelationId[],
  userIds: RelationId[],
  syncUsers: RelationId[],
) => {
  const createdOrUpdatedAt = getCreatedOrUpdatedAt()
  const isScanDismissed = getRandomBoolean()
    ? { create: fakeScanDismiss(faker.helpers.arrayElement(userIds)) }
    : undefined

  return {
    office: { connect: { id: faker.helpers.arrayElement(officeIds).id }},
    users: { connect: faker.helpers.arrayElements(userIds, { min: 1, max: 5 }) },
    media: { create: fakeMedia(faker.helpers.arrayElement(syncUsers)) },
    studyType: '',
    viewerLink: '',
    status: '',
    isInHouse: getRandomBoolean(),
    viewerPlatform: '',
    dismissStatus: isScanDismissed,
    scanSource: '',
    reportImages: '',
    notes: '',
    omrAssignedAt: getRandomBoolean() ? faker.date.past() : null,
    radiologistAssignedAt: getRandomBoolean() ? faker.date.past() : null,
    timezone: '',
    radiologyReportType: '',
    isOmrReportRequested: getRandomBoolean(),
    skippedUntil: faker.date.past(),
    createdAt: createdOrUpdatedAt,
    updatedAt: createdOrUpdatedAt,
  }
}
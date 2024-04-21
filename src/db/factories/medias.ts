import { faker } from "@faker-js/faker";
import { RelationId } from "../types";
import { getCreatedOrUpdatedAt, getRandomSyncVersion } from "./utilities";
import { dicomModalities } from "../definitions";

const fakeStudyUID = () => {
  const prefixParts = [
    '1', '2',
    faker.number.int(99),
    faker.number.int(999),
    faker.number.int(99999),
    faker.number.int(99),
    faker.number.int(99999),
    faker.number.int(99),
    faker.number.int(9999)
  ];

  const prefix = prefixParts.join('.');
  const uidParts = [];

  for (let i = 0; i < 9; i++) {
    uidParts.push(faker.number.int(9999));
  }

  return `zip/${prefix}.${uidParts.join('.')}`;
}

const fakeMetadata = () => {
  return JSON.stringify({
    modality: faker.helpers.arrayElement(dicomModalities),
    transfer_syntax_uid: fakeStudyUID(),
    sop_class_uid: fakeStudyUID(),
    sop_instance_uid: fakeStudyUID(),
    media_storage_sop_class_uid: fakeStudyUID(),
    study_id: faker.string.uuid(),
    study_date: faker.date.past(),
    series_date: faker.date.past(),
    acquisition_date: faker.date.past(),
    patient_name: faker.person.fullName(),
    patient_id: faker.string.uuid(),
    patient_birth_date: faker.date.past(),
    referring_physician_name: faker.person.fullName(),
    patient_sex: faker.person.gender(),
    manufacturer: faker.company.name(),
    institution_name: faker.company.name(),
    institution_address: faker.location.streetAddress(),
    operator_name: faker.person.fullName(),
    slice_thickness: faker.number.float({ min: 0, max: 1 }),
    software_version: getRandomSyncVersion(),
    rows: faker.number.int({ min: 40, max: 1200 }),
    columns: faker.number.int({ min: 40, max: 1200 }),
    number_of_frames: faker.number.int({ min: 40, max: 1200 }),
    frame_of_reference_uid: fakeStudyUID(),
  })
}

export const fakeMedia = (syncUser: RelationId) => {
  const createdOrUpdatedAt = getCreatedOrUpdatedAt()

  return {
    user: { connect: { id: syncUser.id }},
    path: fakeStudyUID(),
    meta: fakeMetadata(),
    createdAt: createdOrUpdatedAt,
    updatedAt: createdOrUpdatedAt,
  }
}
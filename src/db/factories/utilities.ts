import { faker } from '@faker-js/faker';
import { exportWords } from '../definitions';

export const getRandomSyncVersion = () => {
  const major = faker.number.int({ min: 0, max: 7 });
  const minor = faker.number.int({ min: 0, max: 20 });
  return `${major}.${minor}`;
}

export const getCreatedOrUpdatedAt = () => {
  return faker.date.past()
}

export const getRandomBoolean = () => {
  return Boolean(faker.number.int({ min: 0, max: 1 }))
}

export const getRandomMacAddress = () => {
  return Array.from(Array(6)).map(() => {
    return faker.number.int({ min: 0, max: 255 }).toString(16).padStart(2, '0');
  }).join(':').toUpperCase()
}

export const getWatchedDirectory = () => {
  const drive = faker.helpers.arrayElement(['C', 'D', 'E', 'F']);
  const path1 = faker.lorem.word();
  const path2 = faker.lorem.word();
  const path3 = faker.lorem.word();
  const exportDirectory = faker.helpers.arrayElement(exportWords);
  return `${drive}:/${path1}/${path2}/${path3}/${exportDirectory}`;
}
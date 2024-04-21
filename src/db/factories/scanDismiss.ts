import { faker } from "@faker-js/faker"
import { RelationId } from "../types"
import { getCreatedOrUpdatedAt } from "./utilities"

export const fakeScanDismiss = (user: RelationId) => {
  const createdOrUpdatedAt = getCreatedOrUpdatedAt()

  return {
    dismissUser: { connect: { id: user.id }},
    dismissReason: faker.word.words({ count: { min: 5, max: 15 }}),
    dismissAt: faker.date.past(),
    createdAt: createdOrUpdatedAt,
    updatedAt: createdOrUpdatedAt,
  }
}
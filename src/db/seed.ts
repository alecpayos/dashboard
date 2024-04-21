import { PrismaClient } from '@prisma/client'
import { fakeUser } from './factories/users'
import { fakeOffice } from './factories/offices'
import { RelationId } from './types'
import { fakeMedia } from './factories/medias'
import { fakeScan } from './factories/scans'

const prisma = new PrismaClient()

async function main() {
  console.log('Seeding...')

  await prisma.media.deleteMany()
  await prisma.scanDismissStatus.deleteMany()
  await prisma.user.deleteMany()
  await prisma.officeSync.deleteMany()
  await prisma.officeMachine.deleteMany()
  await prisma.smartDismissSettings.deleteMany()
  await prisma.scan.deleteMany()
  await prisma.office.deleteMany()

  const userFakerRounds = 900
  const officesFakerRounds = 300
  const scansFakerRounds = 600

  const userIds: RelationId[] = []
  const officeIds: RelationId[] = []

  const admins: RelationId[] = []
  const partners: RelationId[] = []
  const customers: RelationId[] = []
  const syncUsers: RelationId[] = []

  console.log('Creating users...')
  for (let i = 0; i < userFakerRounds; i++) {
    const { id, type } = await prisma.user.create({
      data: fakeUser()
    })
    
    userIds.push({ id })
    type == 'customer_sync' && syncUsers.push({ id })

    type.includes('company') ? admins.push({ id })
      : type.includes('partner') ? partners.push({ id })
      : type.includes('customer') ? customers.push({ id })
      : null
  }

  console.log('Creating offices...')
  for (let i = 0; i < officesFakerRounds; i++) {
    const { id } = await prisma.office.create({
      data: fakeOffice(userIds),
    })

    officeIds.push({ id })
  }

  console.log('Creating scans with medias...')
  for (let i = 0; i < scansFakerRounds; i++) {
    await prisma.scan.create({
      data: fakeScan(officeIds, userIds, syncUsers)
    })
  }
}

main()
  .then(async () => {
    await prisma.$disconnect()
  })
  .catch(async (e) => {
    console.error(e)
    await prisma.$disconnect()
    process.exit(1)
  })
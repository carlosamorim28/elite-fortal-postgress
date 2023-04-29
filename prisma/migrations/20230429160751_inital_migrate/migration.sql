-- CreateTable
CREATE TABLE "Users" (
    "id" SERIAL NOT NULL,
    "email" TEXT NOT NULL,
    "password" TEXT NOT NULL,
    "rule" TEXT NOT NULL DEFAULT 'player',
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Users_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "UserProfile" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "UserProfile_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Tournaments" (
    "id" SERIAL NOT NULL,
    "name" TEXT NOT NULL,
    "prize" TEXT NOT NULL,
    "local" TEXT NOT NULL,
    "occur_date" TEXT NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,

    CONSTRAINT "Tournaments_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "User_Tournaments" (
    "id" SERIAL NOT NULL,
    "user_profile_id" INTEGER NOT NULL,
    "tournament_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "usersId" INTEGER,

    CONSTRAINT "User_Tournaments_pkey" PRIMARY KEY ("id")
);

-- CreateTable
CREATE TABLE "Slashs" (
    "id" SERIAL NOT NULL,
    "user_profile_1_id" INTEGER NOT NULL,
    "user_profile_2_id" INTEGER NOT NULL,
    "tournament_id" INTEGER NOT NULL,
    "created_at" TIMESTAMP(3) NOT NULL DEFAULT CURRENT_TIMESTAMP,
    "updated_at" TIMESTAMP(3) NOT NULL,
    "usersId" INTEGER,

    CONSTRAINT "Slashs_pkey" PRIMARY KEY ("id")
);

-- AddForeignKey
ALTER TABLE "User_Tournaments" ADD CONSTRAINT "User_Tournaments_user_profile_id_fkey" FOREIGN KEY ("user_profile_id") REFERENCES "UserProfile"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "User_Tournaments" ADD CONSTRAINT "User_Tournaments_tournament_id_fkey" FOREIGN KEY ("tournament_id") REFERENCES "Tournaments"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "User_Tournaments" ADD CONSTRAINT "User_Tournaments_usersId_fkey" FOREIGN KEY ("usersId") REFERENCES "Users"("id") ON DELETE SET NULL ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Slashs" ADD CONSTRAINT "Slashs_tournament_id_fkey" FOREIGN KEY ("tournament_id") REFERENCES "Tournaments"("id") ON DELETE RESTRICT ON UPDATE CASCADE;

-- AddForeignKey
ALTER TABLE "Slashs" ADD CONSTRAINT "Slashs_usersId_fkey" FOREIGN KEY ("usersId") REFERENCES "UserProfile"("id") ON DELETE SET NULL ON UPDATE CASCADE;

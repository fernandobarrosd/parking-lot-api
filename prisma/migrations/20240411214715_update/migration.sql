/*
  Warnings:

  - The primary key for the `Vehicle` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `licensePlace` on the `Vehicle` table. All the data in the column will be lost.
  - You are about to drop the column `vehicleLicensePlace` on the `VehicleRented` table. All the data in the column will be lost.
  - Added the required column `licensePlate` to the `Vehicle` table without a default value. This is not possible if the table is not empty.
  - Added the required column `vehicleLicensePlate` to the `VehicleRented` table without a default value. This is not possible if the table is not empty.

*/
-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_Vehicle" (
    "licensePlate" TEXT NOT NULL PRIMARY KEY,
    "type" TEXT NOT NULL
);
INSERT INTO "new_Vehicle" ("type") SELECT "type" FROM "Vehicle";
DROP TABLE "Vehicle";
ALTER TABLE "new_Vehicle" RENAME TO "Vehicle";
CREATE TABLE "new_VehicleRented" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "vehicleLicensePlate" TEXT NOT NULL,
    "hours" INTEGER NOT NULL,
    "price" REAL NOT NULL,
    CONSTRAINT "VehicleRented_vehicleLicensePlate_fkey" FOREIGN KEY ("vehicleLicensePlate") REFERENCES "Vehicle" ("licensePlate") ON DELETE RESTRICT ON UPDATE CASCADE
);
INSERT INTO "new_VehicleRented" ("hours", "id", "price") SELECT "hours", "id", "price" FROM "VehicleRented";
DROP TABLE "VehicleRented";
ALTER TABLE "new_VehicleRented" RENAME TO "VehicleRented";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;

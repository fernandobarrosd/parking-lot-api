/*
  Warnings:

  - You are about to drop the `Vehicle` table. If the table is not empty, all the data it contains will be lost.
  - The primary key for the `VehicleRented` table will be changed. If it partially fails, the table could be left without primary key constraint.
  - You are about to drop the column `hours` on the `VehicleRented` table. All the data in the column will be lost.
  - You are about to drop the column `id` on the `VehicleRented` table. All the data in the column will be lost.
  - You are about to drop the column `price` on the `VehicleRented` table. All the data in the column will be lost.
  - You are about to drop the column `vehicleLicensePlate` on the `VehicleRented` table. All the data in the column will be lost.
  - Added the required column `licensePlate` to the `VehicleRented` table without a default value. This is not possible if the table is not empty.
  - Added the required column `rentedHours` to the `VehicleRented` table without a default value. This is not possible if the table is not empty.
  - Added the required column `rentedPrice` to the `VehicleRented` table without a default value. This is not possible if the table is not empty.
  - Added the required column `type` to the `VehicleRented` table without a default value. This is not possible if the table is not empty.

*/
-- DropTable
PRAGMA foreign_keys=off;
DROP TABLE "Vehicle";
PRAGMA foreign_keys=on;

-- RedefineTables
PRAGMA foreign_keys=OFF;
CREATE TABLE "new_VehicleRented" (
    "licensePlate" TEXT NOT NULL PRIMARY KEY,
    "type" TEXT NOT NULL,
    "rentedHours" INTEGER NOT NULL,
    "rentedPrice" REAL NOT NULL
);
DROP TABLE "VehicleRented";
ALTER TABLE "new_VehicleRented" RENAME TO "VehicleRented";
PRAGMA foreign_key_check;
PRAGMA foreign_keys=ON;

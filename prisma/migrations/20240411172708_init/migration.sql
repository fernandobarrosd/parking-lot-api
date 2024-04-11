-- CreateTable
CREATE TABLE "Vehicle" (
    "licensePlace" TEXT NOT NULL PRIMARY KEY,
    "type" TEXT NOT NULL
);

-- CreateTable
CREATE TABLE "VehicleRented" (
    "id" TEXT NOT NULL PRIMARY KEY,
    "vehicleLicensePlace" TEXT NOT NULL,
    "hours" INTEGER NOT NULL,
    "price" REAL NOT NULL,
    CONSTRAINT "VehicleRented_vehicleLicensePlace_fkey" FOREIGN KEY ("vehicleLicensePlace") REFERENCES "Vehicle" ("licensePlace") ON DELETE RESTRICT ON UPDATE CASCADE
);

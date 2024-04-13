import { Module } from "@nestjs/common";
import { VehicleController } from "./vehicle/vehicle-rented.controller";
import { VehicleService } from "./vehicle/vehicle.service";

@Module({
  imports: [],
  controllers: [
    VehicleController
  ],
  providers: [
    VehicleService
  ]
})
export class AppModule {}
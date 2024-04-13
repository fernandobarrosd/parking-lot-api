import { Module } from "@nestjs/common";
import { VehicleController } from "./vehicle/vehicle-rented.controller";
import { VehicleService } from "./vehicle/vehicle.service";
import { TypeOrmModule } from "@nestjs/typeorm";

@Module({
  imports: [
    TypeOrmModule.forRoot({
      type: "sqlite",
      database: "src/database.db",
      entities: [],
      migrations: [],
      synchronize: false,
    })
  ],
  controllers: [
    VehicleController
  ],
  providers: [
    VehicleService
  ]
})
export class AppModule {}
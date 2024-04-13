import { Module } from "@nestjs/common";
import { VehicleController } from "./vehicle/vehicle-rented.controller";
import { VehicleService } from "./vehicle/vehicle.service";
import { TypeOrmModule } from "@nestjs/typeorm";

@Module({
  imports: [
    TypeOrmModule.forRoot({
      type: "sqlite",
      database: "src/database.db",
      entities: [`${__dirname}/entities/*.entity.{ts,js}`],
      synchronize: true
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
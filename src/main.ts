import { NestFactory } from "@nestjs/core";
import { AppModule } from "./app.module";
import { NestExpressApplication } from "@nestjs/platform-express";
import { ValidationPipe } from "@nestjs/common";


(async function() {
  const app = await NestFactory.create<NestExpressApplication>(AppModule);
  app.enableCors({ origin: "*" });
  app.useGlobalPipes(new ValidationPipe());
  
  await app.listen(3000);
})();

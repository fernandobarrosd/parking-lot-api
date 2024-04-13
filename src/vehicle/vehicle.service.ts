import { Injectable } from "@nestjs/common";
import { CreateVehicleRentedRequestBody } from "./create-vehicle-rented.request-body";
import { VehicleRentedType } from "./vehicle-rented-type.enum";

@Injectable()
export class VehicleService {

    async createVehicle({ licensePlate, rentedHours, type }: CreateVehicleRentedRequestBody) {
        const hours = parseInt(rentedHours[0]);
        
        const hoursPriceTable = {
            /* 2 horas = 30 reais */
            2: 30,
            /* 4 hours = 50 reais */
            4: 50,

            /* 6 horas = 70 reais */
            6: 70,

            /* 8 horas = 90 reais */
            8: 90
        };
        const taxPriceTable = {
            /* Moto = Uma taxa de aumento de 20 porcento */
            [VehicleRentedType.MOTOCYCLE]: 10/100,

            /* Moto = Uma taxa de aumento de 20 porcento */
            [VehicleRentedType.CAR]: 20/100
        };
        const priceWithoutTax = hoursPriceTable[hours];
        const price = priceWithoutTax + (priceWithoutTax * taxPriceTable[type]);


        
        return {
            licensePlate,
            rented: {
                hours,
                price
            },
            type
        };
    }
    async deleteVehicle(rentedPrice: number, licensePlate: string) {
             
    }
}
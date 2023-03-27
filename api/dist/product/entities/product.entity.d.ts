import { BaseEntity } from '../../core/entity/base.entity';
import { Restaurant } from '../../restaurant/entities/restaurant.entity';
export declare class Product extends BaseEntity {
    constructor(params: Product);
    restaurant: Restaurant;
    name: string;
    imgUrl: string;
    detail: string;
    price: number;
}

import { BaseEntity } from '../../core/entity/base.entity';
import { User } from '../../user/entities/user.entity';
import { Restaurant } from '../../restaurant/entities/restaurant.entity';
import { BasketItemWithFullProductDto } from '../../user/dto/basket-item.dto';
export declare class Order extends BaseEntity {
    constructor(params: Order);
    user: User;
    products: BasketItemWithFullProductDto[];
    restaurant: Restaurant;
    totalPrice: number;
    createdAt: string;
}

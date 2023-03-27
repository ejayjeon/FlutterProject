import { Product } from '../product/entities/product.entity';
import { RestaurantDetail } from '../restaurant/entities/restaurant.entity';
import { Rating } from '../rating/entities/rating.entity';
import { User } from '../user/entities/user.entity';
import { Order } from '../order/entities/order.entity';
export declare class CacheService {
    constructor();
    users: User[];
    orders: Order[];
    ratings: Rating[];
    restaurants: RestaurantDetail[];
    products: Product[];
    createProducts(): void;
    getImagesByRestaurantName(name: string): any[];
    createRestaurants(): void;
    createRatings(): void;
    createUsers(): void;
    getRandomInt(min: any, max: any): number;
}

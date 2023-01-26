import { RestaurantDetail } from '../restaurant/entities/restaurant.entity';
export declare type IRestaurantRaw = Omit<RestaurantDetail, 'id' | 'ratings' | 'ratingsCount' | 'products'>;

import { BaseEntity } from '../../core/entity/base.entity';
import { Restaurant } from '../../restaurant/entities/restaurant.entity';
import { User } from '../../user/entities/user.entity';
export declare class Rating extends BaseEntity {
    constructor(params: Rating);
    user: User;
    restaurant: Restaurant;
    rating: number;
    content: string;
    imgUrls: string[];
}

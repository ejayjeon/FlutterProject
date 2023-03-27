import { CoreService } from '../core/core.service';
import { PaginationDto } from '../core/dto/pagination.dto';
import { Pagination } from '../core/entity/pagination.entity';
import { Rating } from './entities/rating.entity';
import { CacheService } from '../cache/cache.service';
import { User } from '../user/entities/user.entity';
import { CreateRestaurantRatingDto } from '../restaurant/dto/create-restaurant-rating.dto';
export declare class RatingService {
    private coreService;
    private cacheService;
    constructor(coreService: CoreService, cacheService: CacheService);
    paginateRatings(paginationDto: PaginationDto): Pagination<Rating>;
    paginateRestaurantRatings(restaurantId: string, paginationDto: PaginationDto): Pagination<Rating>;
    createRestaurantRating(user: User, restaurantId: string, createRatingDto: CreateRestaurantRatingDto): Rating;
}

import { RestaurantService } from './restaurant.service';
import { PaginationDto } from '../core/dto/pagination.dto';
import { Pagination } from '../core/entity/pagination.entity';
import { Restaurant, RestaurantDetail } from './entities/restaurant.entity';
import { Rating } from '../rating/entities/rating.entity';
import { RatingService } from '../rating/rating.service';
import { CreateRatingDto } from '../rating/dto/create-rating.dto';
export declare class RestaurantController {
    private readonly restaurantService;
    private readonly ratingService;
    constructor(restaurantService: RestaurantService, ratingService: RatingService);
    paginateRestaurants(paginationDto: PaginationDto): Pagination<Restaurant>;
    getRestaurant(id: string): RestaurantDetail;
    paginateRestaurantRatings(id: string, paginationDto: PaginationDto): Pagination<Rating>;
    postRestaurantRating(id: string, req: any, body: CreateRatingDto): Rating;
}

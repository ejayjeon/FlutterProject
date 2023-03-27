import { PaginationDto } from '../core/dto/pagination.dto';
import { Pagination } from '../core/entity/pagination.entity';
import { Restaurant, RestaurantDetail } from './entities/restaurant.entity';
import { CoreService } from '../core/core.service';
import { CacheService } from '../cache/cache.service';
export declare class RestaurantService {
    private coreService;
    private cacheService;
    constructor(coreService: CoreService, cacheService: CacheService);
    paginateRestaurants(paginationDto: PaginationDto): Pagination<Restaurant>;
    getRestaurantById(id: string): RestaurantDetail;
}

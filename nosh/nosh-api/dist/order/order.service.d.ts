import { CreateOrderDto } from './dto/create-order.dto';
import { CacheService } from '../cache/cache.service';
import { User } from '../user/entities/user.entity';
import { Order } from './entities/order.entity';
import { CoreService } from '../core/core.service';
import { PaginationDto } from '../core/dto/pagination.dto';
import { Pagination } from '../core/entity/pagination.entity';
export declare class OrderService {
    private cacheService;
    private coreService;
    constructor(cacheService: CacheService, coreService: CoreService);
    paginateOrders(user: User, paginationDto: PaginationDto): Pagination<Order>;
    postOrder(user: User, createOrderDto: CreateOrderDto): Order;
}

import { OrderService } from './order.service';
import { CreateOrderDto } from './dto/create-order.dto';
import { PaginationDto } from '../core/dto/pagination.dto';
import { Pagination } from '../core/entity/pagination.entity';
import { Order } from './entities/order.entity';
export declare class OrderController {
    private readonly orderService;
    constructor(orderService: OrderService);
    paginateOrder(req: any, paginationDto: PaginationDto): Pagination<Order>;
    postOrder(req: any, body: CreateOrderDto): Order;
}

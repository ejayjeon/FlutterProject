import { BaseEntity } from './entity/base.entity';
import { PaginationDto } from './dto/pagination.dto';
import { Pagination } from './entity/pagination.entity';
export declare class CoreService {
    paginate<T extends BaseEntity>(items: T[], paginationDto: PaginationDto): Pagination<T>;
}

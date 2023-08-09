import { Product } from './entities/product.entity';
import { CacheService } from '../cache/cache.service';
import { CoreService } from '../core/core.service';
import { Pagination } from '../core/entity/pagination.entity';
import { PaginationDto } from '../core/dto/pagination.dto';
export declare class ProductService {
    private cacheService;
    private coreService;
    constructor(cacheService: CacheService, coreService: CoreService);
    getAllProducts(): Product[];
    getProductById(id: string): Product;
    paginateProducts(paginationDto: PaginationDto): Pagination<Product>;
}

import { ProductService } from './product.service';
import { Product } from './entities/product.entity';
import { PaginationDto } from '../core/dto/pagination.dto';
import { Pagination } from '../core/entity/pagination.entity';
export declare class ProductController {
    private readonly productService;
    constructor(productService: ProductService);
    paginateProducts(paginationDto: PaginationDto): Pagination<Product>;
    getProduct(pid: string): Product;
}

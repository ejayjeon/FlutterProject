import { CreateUserDto } from './dto/create-user.dto';
import { User } from './entities/user.entity';
import { Product } from '../product/entities/product.entity';
import { CacheService } from '../cache/cache.service';
import { BasketItemDto, BasketItemWithFullProductDto } from './dto/basket-item.dto';
export declare class UserService {
    private cacheService;
    constructor(cacheService: CacheService);
    findById(id: string): Promise<User>;
    findByUsername(username: string): Promise<User | undefined>;
    createUser({ username, password }: CreateUserDto): Promise<{
        id: string;
    }>;
    getBasket(userId: string): BasketItemWithFullProductDto[];
    addToBasket(userId: string, products: BasketItemDto[]): BasketItemWithFullProductDto[];
    _mapBasketDtoToProduct(products: BasketItemDto[]): {
        product: Product;
        count: number;
    }[];
}

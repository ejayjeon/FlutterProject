import { UserService } from './user.service';
import { User } from './entities/user.entity';
import { BasketItemWithFullProductDto } from './dto/basket-item.dto';
import { PatchMeBasketDto } from './dto/patch-me-basket.dto';
export declare class UserController {
    private readonly userService;
    constructor(userService: UserService);
    getMe(req: any): Promise<User>;
    getMeBasket(req: any): Promise<BasketItemWithFullProductDto[]>;
    patchMeBasket(req: any, body: PatchMeBasketDto): Promise<BasketItemWithFullProductDto[]>;
}

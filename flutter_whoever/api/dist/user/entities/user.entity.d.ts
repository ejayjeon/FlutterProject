import { BaseEntity } from '../../core/entity/base.entity';
import { BasketItemWithFullProductDto } from '../dto/basket-item.dto';
export declare class User extends BaseEntity {
    constructor(params: User);
    username: string;
    imageUrl: string;
    basket: BasketItemWithFullProductDto[];
    password: string;
}

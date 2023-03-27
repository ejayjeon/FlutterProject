import { BasketItemDto } from '../../user/dto/basket-item.dto';
export declare class CreateOrderDto {
    id: string;
    products: BasketItemDto[];
    totalPrice: number;
    createdAt: string;
}

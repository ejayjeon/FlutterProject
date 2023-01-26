import { OrderProduct } from '../../order/entities/order-product-entity';
export declare class BasketItemDto {
    productId: string;
    count: number;
}
export declare class BasketItemWithFullProductDto {
    product: OrderProduct;
    count: number;
}

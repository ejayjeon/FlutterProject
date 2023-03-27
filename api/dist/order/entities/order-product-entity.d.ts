import { BaseEntity } from '../../core/entity/base.entity';
export declare class OrderProduct extends BaseEntity {
    constructor(params: OrderProduct);
    name: string;
    imgUrl: string;
    detail: string;
    price: number;
}

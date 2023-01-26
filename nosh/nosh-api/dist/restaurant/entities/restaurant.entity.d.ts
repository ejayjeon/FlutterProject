import { BaseEntity } from '../../core/entity/base.entity';
export declare enum RestaurantPriceRange {
    cheap = "cheap",
    medium = "medium",
    expensive = "expensive"
}
export declare class RestaurantProduct extends BaseEntity {
    constructor(params: RestaurantProduct);
    name: string;
    imgUrl: string;
    detail: string;
    price: number;
}
export declare class Restaurant extends BaseEntity {
    constructor(params: Restaurant);
    name: string;
    thumbUrl: string;
    tags: string[];
    priceRange: RestaurantPriceRange;
    ratings: number;
    ratingsCount: number;
    deliveryTime: number;
    deliveryFee: number;
}
export declare class RestaurantDetail extends Restaurant {
    constructor(params: RestaurantDetail);
    detail: string;
    products: RestaurantProduct[];
}

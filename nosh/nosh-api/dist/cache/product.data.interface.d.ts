import { Product } from '../product/entities/product.entity';
export declare type IProductRaw = Omit<Product, 'id' | 'restaurantId' | 'restaurant'>;

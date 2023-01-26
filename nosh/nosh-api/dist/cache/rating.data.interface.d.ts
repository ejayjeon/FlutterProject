import { Rating } from '../rating/entities/rating.entity';
export declare type IRatingRaw = Omit<Rating, 'id' | 'restaurant' | 'user' | 'imgUrls'>;

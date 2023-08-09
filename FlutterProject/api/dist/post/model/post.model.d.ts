import { Model } from "sequelize-typescript";
export declare class Post extends Model {
    no: number;
    title: string;
    content: string;
    author: string;
    viewCount: number;
    created: string;
    updated: string;
    isActive: boolean;
    readonly readOnlyPost: {
        no: number;
        title: string;
        content: string;
        author: string;
        created: string;
        updated: string;
    };
}

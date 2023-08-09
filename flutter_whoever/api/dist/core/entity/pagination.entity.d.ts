export declare class PaginationMeta {
    count: number;
    hasMore: boolean;
}
export declare class Pagination<T> {
    meta: PaginationMeta;
    data: T[];
}

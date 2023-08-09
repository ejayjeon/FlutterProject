"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.CoreService = void 0;
const common_1 = require("@nestjs/common");
let CoreService = class CoreService {
    paginate(items, paginationDto) {
        const copyItems = [...items];
        const startIdx = paginationDto.after
            ? copyItems.findIndex((item) => item.id === paginationDto.after)
            : 0;
        const plusOneData = copyItems.splice(startIdx === 0 ? startIdx : startIdx + 1, paginationDto.count + 1);
        const hasMore = plusOneData.length > paginationDto.count;
        const data = hasMore
            ? plusOneData.splice(0, paginationDto.count)
            : plusOneData;
        return {
            meta: {
                count: data.length,
                hasMore,
            },
            data,
        };
    }
};
CoreService = __decorate([
    (0, common_1.Injectable)()
], CoreService);
exports.CoreService = CoreService;
//# sourceMappingURL=core.service.js.map
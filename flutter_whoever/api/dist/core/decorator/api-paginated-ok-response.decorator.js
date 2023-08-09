"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.ApiPaginatedOkResponseDecorator = void 0;
const common_1 = require("@nestjs/common");
const swagger_1 = require("@nestjs/swagger");
const pagination_entity_1 = require("../entity/pagination.entity");
const ApiPaginatedOkResponseDecorator = (model, options = {}) => {
    return (0, common_1.applyDecorators)((0, swagger_1.ApiOkResponse)(Object.assign(Object.assign({}, options), { schema: {
            properties: {
                meta: {
                    $ref: (0, swagger_1.getSchemaPath)(pagination_entity_1.PaginationMeta),
                },
                data: {
                    type: 'array',
                    items: {
                        $ref: (0, swagger_1.getSchemaPath)(model),
                    },
                },
            },
        } })));
};
exports.ApiPaginatedOkResponseDecorator = ApiPaginatedOkResponseDecorator;
//# sourceMappingURL=api-paginated-ok-response.decorator.js.map
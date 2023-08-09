"use strict";
Object.defineProperty(exports, "__esModule", { value: true });
exports.ApiBasicTokenHeader = exports.ApiBearerTokenHeader = void 0;
const common_1 = require("@nestjs/common");
const swagger_1 = require("@nestjs/swagger");
const ApiBearerTokenHeader = () => {
    return (0, common_1.applyDecorators)((0, swagger_1.ApiHeader)({
        name: 'authorization',
        required: true,
        description: 'Bearer 토큰',
        example: 'Bearer xjvjiwsijzkxcjvoiasdjf',
    }));
};
exports.ApiBearerTokenHeader = ApiBearerTokenHeader;
const ApiBasicTokenHeader = () => {
    return (0, common_1.applyDecorators)((0, swagger_1.ApiHeader)({
        name: 'authorization',
        required: true,
        description: 'Basic 토큰',
        example: 'Basic xjvjiwsijzkxcjvoiasdjf',
    }));
};
exports.ApiBasicTokenHeader = ApiBasicTokenHeader;
//# sourceMappingURL=api-bearer-token-header.js.map
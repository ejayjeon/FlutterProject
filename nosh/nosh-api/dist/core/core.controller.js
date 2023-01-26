"use strict";
var __decorate = (this && this.__decorate) || function (decorators, target, key, desc) {
    var c = arguments.length, r = c < 3 ? target : desc === null ? desc = Object.getOwnPropertyDescriptor(target, key) : desc, d;
    if (typeof Reflect === "object" && typeof Reflect.decorate === "function") r = Reflect.decorate(decorators, target, key, desc);
    else for (var i = decorators.length - 1; i >= 0; i--) if (d = decorators[i]) r = (c < 3 ? d(r) : c > 3 ? d(target, key, r) : d(target, key)) || r;
    return c > 3 && r && Object.defineProperty(target, key, r), r;
};
var __metadata = (this && this.__metadata) || function (k, v) {
    if (typeof Reflect === "object" && typeof Reflect.metadata === "function") return Reflect.metadata(k, v);
};
var __param = (this && this.__param) || function (paramIndex, decorator) {
    return function (target, key) { decorator(target, key, paramIndex); }
};
Object.defineProperty(exports, "__esModule", { value: true });
exports.CoreController = void 0;
const common_1 = require("@nestjs/common");
const core_service_1 = require("./core.service");
const platform_express_1 = require("@nestjs/platform-express");
const multer = require("multer");
const swagger_1 = require("@nestjs/swagger");
let CoreController = class CoreController {
    constructor(coreService) {
        this.coreService = coreService;
    }
    postUpload(file) {
        return {
            fileName: file.filename,
        };
    }
};
__decorate([
    (0, common_1.Post)('upload'),
    (0, common_1.UseInterceptors)((0, platform_express_1.FileInterceptor)('file', {
        storage: multer.diskStorage({
            destination: function (req, file, cb) {
                cb(null, 'public/uploads');
            },
            filename: function (req, file, cb) {
                const ext = file.mimetype.split('/').reverse()[0];
                cb(null, req.body['fileName']);
            },
        }),
    })),
    (0, swagger_1.ApiOperation)({
        summary: '파일 업로드하기',
    }),
    (0, swagger_1.ApiOkResponse)({
        description: '업로드된 파일의 경로',
        schema: {
            properties: {
                fileName: {
                    type: 'string',
                    description: '파일 경로',
                    example: '/img/123123.png',
                },
            },
        },
    }),
    (0, swagger_1.ApiBody)({
        schema: {
            properties: {
                file: {
                    type: 'string',
                    format: 'binary',
                    description: '업로드할 파일',
                },
            },
        },
    }),
    __param(0, (0, common_1.UploadedFile)()),
    __metadata("design:type", Function),
    __metadata("design:paramtypes", [Object]),
    __metadata("design:returntype", void 0)
], CoreController.prototype, "postUpload", null);
CoreController = __decorate([
    (0, swagger_1.ApiTags)('core'),
    (0, common_1.Controller)('core'),
    __metadata("design:paramtypes", [core_service_1.CoreService])
], CoreController);
exports.CoreController = CoreController;
//# sourceMappingURL=core.controller.js.map
/// <reference types="multer" />
import { CoreService } from './core.service';
export declare class CoreController {
    private readonly coreService;
    constructor(coreService: CoreService);
    postUpload(file: Express.Multer.File): {
        fileName: string;
    };
}

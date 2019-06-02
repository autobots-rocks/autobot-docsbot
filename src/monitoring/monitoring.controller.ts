import { Controller, Get } from '@nestjs/common';

@Controller('/monitoring')
export class MonitoringController {

    @Get('/is_alive')
    public isAlive(): string {

        return 'coooookies';

    }

}

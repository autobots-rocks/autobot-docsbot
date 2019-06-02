import { Module }               from '@nestjs/common';
import { MonitoringController } from './monitoring.controller';

@Module({

    imports: [],
    controllers: [ MonitoringController ],
    providers: [],
    exports: []

})
export class MonitoringModule {
}

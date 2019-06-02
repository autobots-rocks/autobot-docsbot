import { Module }           from '@nestjs/common';
import { MonitoringModule } from './monitoring/monitoring.module';

@Module({

    imports: [

        MonitoringModule,

    ],
    controllers: [],
    providers: [],

})
export class AppModule {

}

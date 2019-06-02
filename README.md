# devdocs.io discord bot

Queries devdocs.io json schema for names via !js strict_mode etc.
This bot comes with a simple monitoring endpoint for monitoring the bot being up (used with kubernetes).
This bot uses the ___docsbot___ role for users to be able to query.

## Installing
You need to `npm install` and `cp .env.sample .env` updating your bot token in the `.env` file.

```bash
git clone https://github.com/autobots-rocks/autobot-docsbot
cd autobot-docsbot
cp .env.sample .env
```

## Starting

`npm run start`

```bash
± |master S:395 U:390 ?:598 ✗| → npm run start

> @autobots/autobot-docsbot@1.0.0 start /Users/yomateod/workspace/work/autobots/autobot-docsbot
> node dist/main.js

[Nest] 11223   - 06/02/2019, 2:01 PM   [NestFactory] Starting Nest application...
Sun Jun 02 2019 14:01:52 GMT-0500 (Central Daylight Time): Logging into discord
[Nest] 11223   - 06/02/2019, 2:01 PM   [InstanceLoader] AppModule dependencies initialized +494ms
[Nest] 11223   - 06/02/2019, 2:01 PM   [InstanceLoader] MonitoringModule dependencies initialized +0ms
[Nest] 11223   - 06/02/2019, 2:01 PM   [RoutesResolver] MonitoringController {/monitoring}: +4ms
[Nest] 11223   - 06/02/2019, 2:01 PM   [RouterExplorer] Mapped {/is_alive, GET} route +2ms
[Nest] 11223   - 06/02/2019, 2:01 PM   [NestApplication] Nest application successfully started +2ms
Sun Jun 02 2019 14:01:52 GMT-0500 (Central Daylight Time): Bootstrapping /Users/yomateod/workspace/work/autobots/autobot-docsbot/node_modules/@autobot/module-docsbot
Sun Jun 02 2019 14:01:52 GMT-0500 (Central Daylight Time): Command Registered: !js (!js <search term>)
Sun Jun 02 2019 14:01:52 GMT-0500 (Central Daylight Time): Bot Started
Sun Jun 02 2019 14:01:53 GMT-0500 (Central Daylight Time): Connected to discord
```
## Monitoring
The monitoring endpoint is available at http://localhost:8080/monitoring/is_alive.

## Docker
This bot comes with its own `Dockerfile`.

### Building
```bash
docker built -t docsbot .
```

### Running
```bash
docker run -d -p8080:8080 --name docsbot docsbot
```

### Viewling Logs
```bash
 docker logs -f docsbot
```
 
### Stopping
```bash
 docker rm -f docsbot
```

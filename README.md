![logo.png](logo.png)
  
![screen1.png](screen1.png)

# devdocs.io + cheat.sh discord bot

Queries devdocs.io json schema for names via !js strict_mode etc.
This bot comes with a simple monitoring endpoint for monitoring the bot being up (used with kubernetes).
This bot uses the ___docsbot___ role for users to be able to query.

## Commands

| Command               | Description                                               |
|-----------------------|-----------------------------------------------------------|
| `#update <language>`  | Downloads a language pack from devdocs.io.                |
| `#list`               | Lists downloaded language packs.                          |
| `#terms <language>`   | Lists terms searchable by language pack.                  |
| `#<language> <term>`  | Displays documentation for a language + term.             |
| `#cheat <command>`    | Displays documentation from cheat.sh for a command.       |
    
## Setup
Clone the repo, run `npm install` inside of it, and copy the template `.env` file.

```bash
git clone https://github.com/autobots-rocks/autobot-docsbot
cd autobot-docsbot
npm install
cp .env.sample .env
```

Next replace your discord token into the `TOKEN` variable in the `.env` file.

```bash
TOKEN=XXXXXXXXXXX_YOUR_TOKEN_HERE_XXXXXXXXXXXXXX
```

And replace the the `DOCSBOT_SAVE_PATH` variable with the FULL path.
```bash
DOCSBOT_SAVE_PATH=/home/username/location/where/data/should/be/saved
```

Finally, create and give yourself the role 'docsbot' on Discord, unless changed in `.env`.


## Building
```bash
npm run build
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
docker build -t docsbot .
```

### Running 
```bash
docker run -d -p8080:8080 --name docsbot docsbot
```

### Viewing Logs
```bash
 docker logs -f docsbot
```
 
### Stopping
```bash
 docker rm -f docsbot
```

## Kubernetes
To deploy to kubernetes simply run the `make install` command. 
This will `kubectl apply` the files in the manifests directory installing the deployment and service.
You will want to edit the image name in the Makefile or the deployment.yaml file.

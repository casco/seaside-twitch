# seaside-twitch
Twitch components for seaside

```
WAAdmin register: TwitchLoginComponent asApplicationAt: 'twitch/login'.
WAAdmin register: TwitchOAuthCallbackComponent asApplicationAt: 'twitch/callback'.

"You can get these at https://dev.twitch.tv/console/apps/"
OSEnvironment current at: 'TWITCH_CLIENT_ID' put: 'your-client-id'.
OSEnvironment current at:  'CLIENT_SECRET' put: 'your-client-secret'.
```

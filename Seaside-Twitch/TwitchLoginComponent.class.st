Class {
	#name : #TwitchLoginComponent,
	#superclass : #TwitchAbstractComponent,
	#category : #'Seaside-Twitch'
}

{ #category : #private }
TwitchLoginComponent >> oauthAuthorizeUrl [

	| clientId redirectUri scope |
	clientId := self twitchClientId.
	redirectUri := 'http://localhost:8080/twitch/callback'.
	scope := 'chat:read+chat:edit'.
	^ 'https://id.twitch.tv/oauth2/authorize?client_id=' , clientId
	  , '&redirect_uri=' , redirectUri , '&response_type=code&scope='
	  , scope
]

{ #category : #rendering }
TwitchLoginComponent >> renderContentOn: html [

	html heading: 'Login with Twitch'.
	html anchor
		url: self oauthAuthorizeUrl;
		with: 'Login with Twitch'
]

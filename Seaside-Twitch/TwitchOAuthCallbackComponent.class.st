Class {
	#name : #TwitchOAuthCallbackComponent,
	#superclass : #TwitchAbstractComponent,
	#category : #'Seaside-Twitch'
}

{ #category : #private }
TwitchOAuthCallbackComponent >> exchangeCodeForToken: code [

	| clientId clientSecret redirectUri response json tokenFile |
	clientId := self twitchClientId .
	clientSecret := self twitchClientSecret .
	redirectUri := 'http://localhost:8080/twitch/callback'.
	response := ZnClient new
		            url: 'https://id.twitch.tv/oauth2/token';
		            method: 'POST';
		            formAdd: 'client_id' -> clientId;
		            formAdd: 'client_secret' -> clientSecret;
		            formAdd: 'code' -> code;
		            formAdd: 'grant_type' -> 'authorization_code';
		            formAdd: 'redirect_uri' -> redirectUri;
		            execute.
	json := NeoJSONReader fromString: response contents.
	tokenFile := FileSystem workingDirectory / 'twitch-token.json'.
	tokenFile writeStreamDo: [ :stream |
		stream nextPutAll: (NeoJSONWriter toString: json) ].
	self requestContext respond: [ :res |
		res contentType: ZnMimeType textHtml.
		res nextPutAll: 'Token received and saved to twitch-token.json.' ]
]

{ #category : #initialization }
TwitchOAuthCallbackComponent >> initialRequest: aRequest [

	| code |
	code := aRequest queryFields at: 'code' ifAbsent: [ nil ].
	code ifNil: [
		self requestContext respond: [ :r | r nextPutAll: 'Missing code.' ] ].
	self exchangeCodeForToken: code
]

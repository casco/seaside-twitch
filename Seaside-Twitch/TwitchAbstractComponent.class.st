Class {
	#name : #TwitchAbstractComponent,
	#superclass : #WAComponent,
	#category : #'Seaside-Twitch'
}

{ #category : #private }
TwitchAbstractComponent >> twitchClientId [
	^(OSEnvironment current at: 'TWITCH_CLIENT_ID' ifAbsent: '')

]

{ #category : #private }
TwitchAbstractComponent >> twitchClientSecret [
	^(OSEnvironment current at: 'TWITCH_CLIENT_SECRET' ifAbsent: '')

]

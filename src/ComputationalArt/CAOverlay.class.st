Class {
	#name : #CAOverlay,
	#superclass : #Morph,
	#instVars : [
		'game'
	],
	#category : #ComputationalArt
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JAL 6/19/2024 15:16'
}
CAOverlay >> game [
	^ game.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JAL 6/19/2024 15:13'
}
CAOverlay >> game: aCAGame [
	game := aCAGame.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 6/23/2024 15:32'
}
CAOverlay >> initialize [
	super initialize.
	"self color: Color black."
	self color: Color transparent.
	self extent: 300@600.

	self addMorph: [|c| c:= CAOverlayPlayMenu new. c initialize. c ] value.
	self addMorph: [|c| c:= CAOverlayBlockMenu new. c initialize. c y: 170. c ] value.
	self addMorph: [|c| c:= CAOverlayBrushMenu new. c initialize. c y: 900. c ] value.
	

]

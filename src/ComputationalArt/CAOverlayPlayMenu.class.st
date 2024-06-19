Class {
	#name : #CAOverlayPlayMenu,
	#superclass : #Morph,
	#instVars : [
		'isPaused'
	],
	#category : #ComputationalArt
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JAL 6/19/2024 15:54'
}
CAOverlayPlayMenu >> initialize [
	| pauseList |
	super initialize.
	"self color: Color black."
	self color: Color transparent.
	self extent: 300@300.
	self addMorph: [|s| s := (CAOverlayItem new) initialize. s x: 30; contents: 'Pause Menu'. s] value.
	
	pauseList := CAOverlayList new fromListOfStrings: #('>' '+1' '+10').
	pauseList horizontalWithMargin: 10.
	pauseList setOnclickhandler: [:list :item | 
		item contents = '>' ifTrue: [item contents: '='. self owner game toggleRunning.] ifFalse: [
		item contents = '=' ifTrue: [item contents: '>'. self owner game toggleRunning.]].
		item contents = '+1' ifTrue: [self owner game skipAhead: 1.].
		item contents = '+10' ifTrue: [self owner game skipAhead: 10.].
	].
	self addMorph: pauseList.
	pauseList y: 70.
	

]

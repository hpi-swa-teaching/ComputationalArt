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
	#'squeak_changestamp' : 'JAL 6/19/2024 15:36'
}
CAOverlayPlayMenu >> initialize [
	| pauseList |
	super initialize.
	"self color: Color black."
	self color: Color transparent.
	self extent: 300@300.
	self addMorph: [|s| s := (CAOverlayItem new) initialize.
		s onclick: [:evt | self submorphsDo: [:t| t color: Color white]. s color: Color green];
		x: 30; contents: 'Pause Menu'. s] value.
	
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
	
	"self addMorph: [|s| 
		s := (CAOverlayItem new) initialize. s y: 70. s x: 30. s contents: '>'. 
		s onclick: [:evt | self submorphsDo: [:t| t color: Color white]. s color: Color green. ]. s] value.
	self addMorph: [|s| 
		s := (CAOverlayItem new) initialize. s y: 70. s x: 80. s contents: '='. 
		s onclick: [:evt | self submorphsDo: [:t| t color: Color white]. s color: Color green.]. s] value.
	self addMorph: [|s| 
		s := (CAOverlayItem new) initialize. s y: 70. s x: 130. s contents: '+1'. 
		s onclick: [:evt | self submorphsDo: [:t| t color: Color white]. s color: Color green]. s] value.
	self addMorph: [|s| 
		s := (CAOverlayItem new) initialize. s y: 70. s x: 200. s contents: '+10'. 
		s onclick: [:evt | self submorphsDo: [:t| t color: Color white]. s color: Color green]. s] value."
	

]

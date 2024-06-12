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
	#'squeak_changestamp' : 'JAL 6/12/2024 18:07'
}
CAOverlayPlayMenu >> initialize [
	super initialize.
	self color: Color black.
	self extent: 300@300.
	self addMorph: [|s| s := (CAOverlayItem new) initialize.
		s onclick: [:evt | self submorphsDo: [:t| t color: Color white]. s color: Color green];
		x: 30; contents: 'Pause Menu'. s] value.
	
	self addMorph: [|s| 
		s := (CAOverlayItem new) initialize. s y: 70. s x: 30. s contents: '>'. 
		s onclick: [:evt | ((s contents) = '>') ifTrue: [s contents: '='.] ifFalse: [s contents: '>'.].]. s] value.
	self addMorph: [|s| 
		s := (CAOverlayItem new) initialize. s y: 70. s x: 80. s contents: '>>'. 
		s onclick: [:evt | self submorphsDo: [:t| t color: Color white]. s color: Color green.]. s] value.
	self addMorph: [|s| 
		s := (CAOverlayItem new) initialize. s y: 70. s x: 170. s contents: '+10'. 
		s onclick: [:evt | self submorphsDo: [:t| t color: Color white]. s color: Color green]. s] value.
	

]

Class {
	#name : #CAOverlayBlockMenu,
	#superclass : #Morph,
	#instVars : [
		'currentlySelectedBlock'
	],
	#category : #ComputationalArt
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JAL 6/12/2024 16:06'
}
CAOverlayBlockMenu >> initialize [
	|blockTypes|
	
	super initialize.
	self color: Color black.
	self extent: 300@300.
	
	self addMorph: [|s| s := (CAOverlayItem new) initialize.
		s onclick: [:evt |].s contents: 'BlockMenu'. s] value.
	
	blockTypes := #('Water' 'Sand' 'Stone' 'Air').
	blockTypes withIndexDo: [:type :i | |item|
		Transcript show: type.
		item := CAOverlayItem new.
		item initialize; contents: type;
		onclick: [:evt | 
			currentlySelectedBlock:= type. 
			self submorphsDo: [:t| t color: Color white]. 
			item color: Color green.].
		item y: (i * 70); x: 150.
		self addMorph: item ].
	

]

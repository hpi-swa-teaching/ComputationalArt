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
	#'squeak_changestamp' : 'JAL 6/19/2024 15:36'
}
CAOverlayBlockMenu >> initialize [
	| blockList |
	
	super initialize.
	"self color: Color black."
	self color: Color transparent.
	self extent: 300@300.
	
	self addMorph: [|s| s := (CAOverlayItem new) initialize. s contents: 'BlockMenu'. s] value.
	
	blockList := CAOverlayList new fromListOfStrings: #('Water' 'Sand' 'Stone' 'Air').
	blockList verticalWithMargin: 10.
	blockList setOnclickhandler: [:list :item | 
		list submorphsDo: [:t| t color: Color white].
		item color: Color green.
		item contents = 'Water' ifTrue: [self owner game setActiveCellTypeTo: CABlocks water.].
		item contents = 'Sand' ifTrue: [self owner game setActiveCellTypeTo: CABlocks sand.].
		item contents = 'Stone' ifTrue: [self owner game setActiveCellTypeTo: CABlocks stone.].
		item contents = 'Air' ifTrue: [self owner game setActiveCellTypeTo: CABlocks air.].
		].
	self addMorph: blockList.
	blockList y: 70.
	
	"blockTypes withIndexDo: [:type :i | |item|
		Transcript show: type.
		item := CAOverlayItem new.
		item initialize; contents: type;
		onclick: [:evt | 
			currentlySelectedBlock:= type. 
			self submorphsDo: [:t| t color: Color white]. 
			item color: Color green.].
		item y: (i * 70); x: 150.
		self addMorph: item ]."
	

]

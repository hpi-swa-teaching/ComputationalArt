Class {
	#name : #CAOverlayBrushMenu,
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
CAOverlayBrushMenu >> initialize [
	| brushList |
	
	super initialize.
	"self color: Color black."
	self color: Color transparent.
	self extent: 300@500.
	
	self addMorph: [|s| s := (CAOverlayItem new) initialize. s contents: 'Brush Size'. s] value.
	
	brushList := CAOverlayList new fromListOfStrings: #('1x1' '2x2' '3x3' '5x5' '10x10').
	brushList horizontalWithMargin: 10.
	brushList setOnclickhandler: [:list :item | 
		list submorphsDo: [:t| t color: Color white].
		item color: Color green.
		item contents = '1x1' ifTrue: [self owner game brushSize: 1.].
		item contents = '2x2' ifTrue: [self owner game brushSize: 2.].
		item contents = '3x3' ifTrue: [self owner game brushSize: 3.].
		item contents = '5x5' ifTrue: [self owner game brushSize: 5.].
		item contents = '10x10' ifTrue: [self owner game brushSize: 10.].
		].
	self addMorph: brushList.
	brushList y: 70.
	
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

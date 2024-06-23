Class {
	#name : #CAOverlayBrushMenu,
	#superclass : #CAOverlayItem,
	#category : #ComputationalArt
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JAL 6/23/2024 15:03'
}
CAOverlayBrushMenu >> initialize [
	| brushList |
	
	super initialize.
	
	self addMorph: [|s| s := (CAOverlayListItem new) initialize. s contents: 'Brush Size'. s] value.
	
	brushList := CAOverlayList new fromListOfStrings: #('1x1' '3x3' '5x5' '9x9' '15x15').
	brushList horizontalWithMargin: 10.
	brushList setOnclickhandler: [:list :item | 
		list submorphsDo: [:t| t color: Color white].
		item color: Color green.
		item contents = '1x1' ifTrue: [self owner game brushSize: 1.].
		item contents = '3x3' ifTrue: [self owner game brushSize: 2.].
		item contents = '5x5' ifTrue: [self owner game brushSize: 3.].
		item contents = '9x9' ifTrue: [self owner game brushSize: 5.].
		item contents = '15x15' ifTrue: [self owner game brushSize: 8.].
		].
	self addMorph: brushList.
	brushList y: 70.
	

]

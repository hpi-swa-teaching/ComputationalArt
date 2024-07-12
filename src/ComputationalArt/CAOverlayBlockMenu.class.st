Class {
	#name : #CAOverlayBlockMenu,
	#superclass : #CAOverlayItem,
	#category : #ComputationalArt
}

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'KoPa 7/12/2024 23:55'
}
CAOverlayBlockMenu >> initialize [

	| blockList s|
	super initialize.
	self addMorph: 
		[s := (CAOverlayListItem new) initialize. 
		 s contents: 'BlockMenu'. s] value.
	
	blockList := CAOverlayList new fromListOfStrings: 
	#('Water' 'Sand' 'Stone' 'Air' 'TNT' 'Wood' 'Algae' 'Fire' 'Fish' 'Smoke').
	blockList verticalWithMargin: 10.
	blockList setOnclickhandler: [:list :item | 
		list submorphsDo: [:t| t color: Color white].
		item color: Color green.
		item contents = 'Water' ifTrue: [self owner game setActiveCellTypeTo: CABlocks water.].
		item contents = 'Sand' ifTrue: [self owner game setActiveCellTypeTo: CABlocks sand.].
		item contents = 'Stone' ifTrue: [self owner game setActiveCellTypeTo: CABlocks stone.].
		item contents = 'Air' ifTrue: [self owner game setActiveCellTypeTo: CABlocks air.].
		item contents = 'TNT' ifTrue: [self owner game setActiveCellTypeTo: CABlocks tnt.].
		item contents = 'Wood' ifTrue: [self owner game setActiveCellTypeTo: CABlocks wood.].
		item contents = 'Algae' ifTrue: [self owner game setActiveCellTypeTo: CABlocks algae.].
		item contents = 'Fire' ifTrue: [self owner game setActiveCellTypeTo: CABlocks fire.].
		item contents = 'Fish' ifTrue: [self owner game setActiveCellTypeTo: CABlocks fish.].
		item contents = 'Smoke' ifTrue: [self owner game setActiveCellTypeTo: CABlocks smoke.].
		].
	self addMorph: blockList.
	blockList y: 70.
	

]

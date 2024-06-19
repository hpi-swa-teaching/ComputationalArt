Class {
	#name : #CAOverlayList,
	#superclass : #Morph,
	#instVars : [
		'onClickHandler'
	],
	#category : #ComputationalArt
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JAL 6/18/2024 15:28'
}
CAOverlayList >> fromListOfStrings: aListOfStrings [
	aListOfStrings reverse withIndexDo: [:type :i | |item|
		item := CAOverlayItem new.
		item initialize; contents: type;
		onclick: [:evt | self onItemClick: item].
		self addMorph: item ].
	^ self
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JAL 6/18/2024 11:43'
}
CAOverlayList >> horizontal [
	self horizontalWithMargin: 0.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JAL 6/18/2024 11:55'
}
CAOverlayList >> horizontalWithMargin: aMargin [
	| left |
	left := 0.
	self submorphsDo: [ :s| s x: left + (s width / 2). left := left + s width + aMargin].
	self width: (left - aMargin).
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JAL 6/18/2024 12:00'
}
CAOverlayList >> initialize [	
	super initialize.
	"self color: Color black."
	self color: Color transparent.
	

]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JAL 6/18/2024 12:14'
}
CAOverlayList >> onItemClick: aOverlayItem [
	onClickHandler value: self value: aOverlayItem.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JAL 6/18/2024 12:09'
}
CAOverlayList >> setOnclickhandler: aBlock [
	onClickHandler := aBlock.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JAL 6/18/2024 11:45'
}
CAOverlayList >> vertical [
	self verticalWithMargin: 0.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JAL 6/18/2024 11:56'
}
CAOverlayList >> verticalWithMargin: aMargin [
	| top |
	top := 0.
	self submorphsDo: [ :s| s y: top. top := top + s height + aMargin].
	self height: (top - aMargin).
]

Class {
	#name : #CAOverlayListItem,
	#superclass : #Morph,
	#instVars : [
		'onclickhandler',
		'stringmorph'
	],
	#category : #ComputationalArt
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JAL 6/18/2024 12:08'
}
CAOverlayListItem >> contents [
	^stringmorph contents
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JAL 6/5/2024 16:06'
}
CAOverlayListItem >> contents: aString [
	stringmorph contents: aString.
	self extent: (stringmorph extent).
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JAL 6/5/2024 15:11'
}
CAOverlayListItem >> handlesMouseDown: evt [
    ^true
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JAL 6/5/2024 16:06'
}
CAOverlayListItem >> initialize [
	super initialize.
	stringmorph := StringMorph new.
	self color: Color white.
	self addMorph: stringmorph.
	self extent: (stringmorph extent).
	^self.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JAL 6/18/2024 12:21'
}
CAOverlayListItem >> mouseDown: evt [
	Transcript show: evt.
	Transcript show: onclickhandler.
	onclickhandler ifNotNil: [onclickhandler value: evt].
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JAL 6/5/2024 15:12'
}
CAOverlayListItem >> mouseUp: evt [
    Transcript show: evt.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JAL 6/5/2024 15:24'
}
CAOverlayListItem >> onclick: aBlock [
	onclickhandler := aBlock.
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JAL 6/5/2024 15:27'
}
CAOverlayListItem >> onclickhandler [
	 ^onclickhandler
	
]

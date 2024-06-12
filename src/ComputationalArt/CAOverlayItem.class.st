Class {
	#name : #CAOverlayItem,
	#superclass : #Morph,
	#instVars : [
		'onclickhandler',
		'stringmorph'
	],
	#category : #ComputationalArt
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JAL 6/12/2024 18:03'
}
CAOverlayItem >> contents [
	 ^ stringmorph contents
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JAL 6/5/2024 16:06'
}
CAOverlayItem >> contents: aString [
	stringmorph contents: aString.
	self extent: (stringmorph extent).
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JAL 6/5/2024 15:11'
}
CAOverlayItem >> handlesMouseDown: evt [
    ^true
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JAL 6/5/2024 16:06'
}
CAOverlayItem >> initialize [
	super initialize.
	stringmorph := StringMorph new.
	self color: Color white.
	self addMorph: stringmorph.
	self extent: (stringmorph extent).
	^self.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JAL 6/5/2024 15:26'
}
CAOverlayItem >> mouseDown: evt [
	Transcript show: evt.
	Transcript show: onclickhandler.
	onclickhandler value: evt.
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JAL 6/5/2024 15:12'
}
CAOverlayItem >> mouseUp: evt [
    Transcript show: evt.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JAL 6/5/2024 15:24'
}
CAOverlayItem >> onclick: aBlock [
	onclickhandler := aBlock.
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JAL 6/5/2024 15:27'
}
CAOverlayItem >> onclickhandler [
	 ^onclickhandler
	
]

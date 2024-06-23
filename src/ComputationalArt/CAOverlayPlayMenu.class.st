Class {
	#name : #CAOverlayPlayMenu,
	#superclass : #CAOverlayItem,
	#category : #ComputationalArt
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 6/23/2024 16:34'
}
CAOverlayPlayMenu >> initialize [
	| pauseList |
	super initialize.
	
	self addMorph: [|s| s := (CAOverlayListItem new) initialize. s x: 30; contents: 'Pause Menu'. s] value.
	
	pauseList := CAOverlayList new fromListOfStrings: #('>' '+1' '+10' 'clear').
	pauseList horizontalWithMargin: 10.
	pauseList setOnclickhandler: [:list :item | 
		item contents = '>' ifTrue: [item contents: '='. self owner game toggleRunning.] ifFalse: [
		item contents = '=' ifTrue: [item contents: '>'. self owner game toggleRunning.]].
		item contents = '+1' ifTrue: [self owner game skipAhead: 1.].
		item contents = '+10' ifTrue: [self owner game skipAhead: 10.].
		item contents = 'clear' ifTrue: [self owner game clear.].
	].
	self addMorph: pauseList.
	pauseList y: 70.
	

]

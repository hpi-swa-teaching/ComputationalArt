Class {
	#name : #CAOverlayItem,
	#superclass : #Morph,
	#category : #ComputationalArt
}

{
	#category : #functional,
	#'squeak_changestamp' : 'KoPa 7/12/2024 23:54'
}
CAOverlayItem >> fitChildren [

	| originX originY cornerX cornerY |
	originX := 10000. originY := 10000. cornerX := 0. cornerY:= 0.
	self submorphsDo: [:s | s bounds corner x < originX
		ifTrue: [originX := s bounds origin x]].
	self submorphsDo: [:s | s bounds corner y < originY
		ifTrue: [originY := (s bounds origin y)]].
	self submorphsDo: [:s | s bounds corner x > cornerX
		ifTrue: [cornerX := s bounds corner x]].
	self submorphsDo: [:s | s bounds corner y > cornerY
		ifTrue: [cornerY := (s bounds corner y)]].
	
	self bounds: (Rectangle origin: originX@originY corner: cornerX@cornerY).
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'JAL 6/23/2024 14:13'
}
CAOverlayItem >> initialize [
	super initialize.
	self color: Color transparent.
	
]

{
	#category : #functional,
	#'squeak_changestamp' : 'KoPa 7/12/2024 23:54'
}
CAOverlayItem >> padding: aRectangle [

	self extent: (self extent + aRectangle origin + aRectangle corner).
	self submorphsDo: [:s | s position: (s position + aRectangle origin)]
]

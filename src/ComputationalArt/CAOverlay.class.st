Class {
	#name : #CAOverlay,
	#superclass : #Morph,
	#category : #ComputationalArt
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JAL 6/12/2024 15:35'
}
CAOverlay >> initialize [
	super initialize.
	self color: Color black.
	self extent: 300@600.

	self addMorph: [|c| c:= CAOverlayPlayMenu new. c initialize. c ] value.
	self addMorph: [|c| c:= CAOverlayBlockMenu new. c initialize. c y: 140. c ] value.
	

]

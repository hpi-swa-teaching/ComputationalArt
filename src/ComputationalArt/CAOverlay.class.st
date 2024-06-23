Class {
	#name : #CAOverlay,
	#superclass : #CAOverlayItem,
	#instVars : [
		'game'
	],
	#category : #ComputationalArt
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JAL 6/19/2024 15:16'
}
CAOverlay >> game [
	^ game.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JAL 6/19/2024 15:13'
}
CAOverlay >> game: aCAGame [
	game := aCAGame.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JAL 6/23/2024 17:19'
}
CAOverlay >> initialize [
	| lastHeight menus |
	super initialize.
	menus := OrderedCollection new.
	menus add: CAOverlayPlayMenu new.
	menus add: CAOverlayBlockMenu new.
	menus add: CAOverlayBrushMenu new.
	lastHeight := 0.
	menus
		do: [:m | 
			m y: lastHeight.
			m fitChildren;
				padding: (Rectangle origin: 10 @ 10 corner: 10 @ 50).
			lastHeight := lastHeight + m height.
			self addMorph: m].
	self fitChildren.
	self padding: (Rectangle origin: 10 @ 10 corner: 10 @ 10).
	self color: (Color r: 0.5 g: 0.5 b: 0.5 alpha: 0.3)
]

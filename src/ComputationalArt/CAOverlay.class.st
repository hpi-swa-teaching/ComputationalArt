Class {
	#name : #CAOverlay,
	#superclass : #CAOverlayItem,
	#instVars : [
		'game'
	],
	#category : #ComputationalArt
}

{
	#category : #constants,
	#'squeak_changestamp' : 'KoPa 7/12/2024 20:43'
}
CAOverlay class >> uiPosition [

	^ 130 @ 130.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'KoPa 7/12/2024 23:54'
}
CAOverlay >> game [

	^ game.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'KoPa 7/12/2024 23:54'
}
CAOverlay >> game: aCAGame [

	game := aCAGame.
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'KoPa 7/12/2024 23:54'
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

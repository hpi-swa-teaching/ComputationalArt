Class {
	#name : #CAOverlayTest,
	#superclass : #TestCase,
	#instVars : [
		'overlay',
		'game'
	],
	#category : #ComputationalArtTests
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JAL 6/23/2024 17:31'
}
CAOverlayTest >> expectedFailures [
	^ {#testFillEmptyFail}
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JAL 6/23/2024 17:48'
}
CAOverlayTest >> setUp [
	game := CAGame new.
	overlay := CAOverlay new.
	overlay game: game.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JAL 6/23/2024 17:35'
}
CAOverlayTest >> tearDown [
	game := nil.
	overlay := nil.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'JAL 6/23/2024 17:49'
}
CAOverlayTest >> testBlockMenu [
	| list blocks |
	blocks := CABlocks new.
	list := (overlay submorphOfClass: CAOverlayBlockMenu) submorphOfClass: CAOverlayList.
	list submorphsDo: [:s |
		s click. 
		self assert: (blocks nameOf: (game activeCellType)) equals: s contents asLowercase].
]

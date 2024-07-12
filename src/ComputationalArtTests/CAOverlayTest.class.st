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
	#category : #'initialize-release',
	#'squeak_changestamp' : 'KoPa 7/12/2024 19:58'
}
CAOverlayTest >> expectedFailures [

	^ {#testFillEmptyFail}.
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'KoPa 7/12/2024 19:58'
}
CAOverlayTest >> setUp [

	game := CAGame new.
	overlay := CAOverlay new.
	overlay game: game.
]

{
	#category : #functional,
	#'squeak_changestamp' : 'KoPa 7/12/2024 19:58'
}
CAOverlayTest >> tearDown [

	game := nil.
	overlay := nil.
]

{
	#category : #testing,
	#'squeak_changestamp' : 'KoPa 7/12/2024 19:57'
}
CAOverlayTest >> testBlockMenu [

	| list blocks |
	blocks := CABlocks new.
	list := (overlay submorphOfClass: CAOverlayBlockMenu) submorphOfClass: CAOverlayList.
	list submorphsDo: [:s |
		s click. 
		self assert: (blocks nameAt: (game activeCellType)) equals: s contents asLowercase.].
]

Class {
	#name : #CABlocksTest,
	#superclass : #TestCase,
	#instVars : [
		'blocks'
	],
	#category : #ComputationalArtTests
}

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'KoPa 7/12/2024 20:00'
}
CABlocksTest >> expectedFailures [

	^ {#testWrongIndexFail}.
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'KoPa 7/12/2024 19:57'
}
CABlocksTest >> setUp [

	blocks := CABlocks new.
]

{
	#category : #functional,
	#'squeak_changestamp' : 'KoPa 7/12/2024 19:57'
}
CABlocksTest >> tearDown [

	blocks := nil.
]

{
	#category : #testing,
	#'squeak_changestamp' : 'KoPa 7/12/2024 19:58'
}
CABlocksTest >> testColors [

	self assert: Color white equals: (blocks colorAt: CABlocks air).
	self assert: Color blue equals: (blocks colorAt: CABlocks water).
	self assert: Color yellow equals: (blocks colorAt: CABlocks sand).
	self assert: Color black equals: (blocks colorAt: CABlocks stone).
	self assert: Color green equals: (blocks colorAt: CABlocks algae).
	self assert: Color brown equals: (blocks colorAt: CABlocks wood).
	self assert: Color red equals: (blocks colorAt: CABlocks fire).
	self assert: Color lightGray equals: (blocks colorAt: CABlocks smoke).
	self assert: Color orange equals: (blocks colorAt: CABlocks tnt).
	self assert: Color lightRed equals: (blocks colorAt: CABlocks fish).
]

{
	#category : #testing,
	#'squeak_changestamp' : 'KoPa 7/12/2024 19:58'
}
CABlocksTest >> testIndexMethods [

	self assert: 0 equals: CABlocks air.
	self assert: 1 equals: CABlocks water.
	self assert: 2 equals: CABlocks sand.
	self assert: 3 equals: CABlocks stone.
	self assert: 4 equals: CABlocks algae.
	self assert: 5 equals: CABlocks wood.
	self assert: 6 equals: CABlocks fire.
	self assert: 7 equals: CABlocks smoke.
	self assert: 8 equals: CABlocks tnt.
	self assert: 9 equals: CABlocks fish.
]

{
	#category : #testing,
	#'squeak_changestamp' : 'KoPa 7/12/2024 19:58'
}
CABlocksTest >> testNames [

	self assert: 'air' equals: (blocks nameAt: CABlocks air).
	self assert: 'water' equals: (blocks nameAt: CABlocks water).
	self assert: 'sand' equals: (blocks nameAt: CABlocks sand).
	self assert: 'stone' equals: (blocks nameAt: CABlocks stone).
	self assert: 'algae' equals: (blocks nameAt: CABlocks algae).
	self assert: 'wood' equals: (blocks nameAt: CABlocks wood).
	self assert: 'fire' equals: (blocks nameAt: CABlocks fire).
	self assert: 'smoke' equals: (blocks nameAt: CABlocks smoke).
	self assert: 'tnt' equals: (blocks nameAt: CABlocks tnt).
	self assert: 'fish' equals: (blocks nameAt: CABlocks fish).
]

{
	#category : #testing,
	#'squeak_changestamp' : 'KoPa 7/12/2024 19:58'
}
CABlocksTest >> testWrongIndexFail [

	self assert: 'wall' equals: (blocks nameAt: -1).
]

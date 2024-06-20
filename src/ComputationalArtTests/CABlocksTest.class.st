Class {
	#name : #CABlocksTest,
	#superclass : #TestCase,
	#instVars : [
		'blocks'
	],
	#category : #ComputationalArtTests
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'HaMa 6/20/2024 10:28'
}
CABlocksTest >> expectedFailures [
	^ {#testWrongIndexFail}
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'HaMa 6/20/2024 10:07'
}
CABlocksTest >> setUp [
	blocks := CABlocks new.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'HaMa 6/20/2024 10:07'
}
CABlocksTest >> tearDown [
	blocks := nil.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'HaMa 6/20/2024 10:18'
}
CABlocksTest >> testColors [
	self assert: Color white equals: (blocks colorOf: CABlocks air).
	self assert: Color blue equals: (blocks colorOf: CABlocks water).
	self assert: Color yellow equals: (blocks colorOf: CABlocks sand).
	self assert: Color black equals: (blocks colorOf: CABlocks stone).
	self assert: Color green equals: (blocks colorOf: CABlocks algae).
	self assert: Color brown equals: (blocks colorOf: CABlocks wood).
	self assert: Color red equals: (blocks colorOf: CABlocks fire).
	self assert: Color lightGray equals: (blocks colorOf: CABlocks smoke).
	self assert: Color orange equals: (blocks colorOf: CABlocks tnt).
	self assert: Color lightRed equals: (blocks colorOf: CABlocks fish).
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'HaMa 6/20/2024 10:11'
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
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'HaMa 6/20/2024 10:21'
}
CABlocksTest >> testNames [
	self assert: 'air' equals: (blocks nameOf: CABlocks air).
	self assert: 'water' equals: (blocks nameOf: CABlocks water).
	self assert: 'sand' equals: (blocks nameOf: CABlocks sand).
	self assert: 'stone' equals: (blocks nameOf: CABlocks stone).
	self assert: 'algae' equals: (blocks nameOf: CABlocks algae).
	self assert: 'wood' equals: (blocks nameOf: CABlocks wood).
	self assert: 'fire' equals: (blocks nameOf: CABlocks fire).
	self assert: 'smoke' equals: (blocks nameOf: CABlocks smoke).
	self assert: 'tnt' equals: (blocks nameOf: CABlocks tnt).
	self assert: 'fish' equals: (blocks nameOf: CABlocks fish).
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'HaMa 6/20/2024 10:27'
}
CABlocksTest >> testWrongIndexFail [
	self assert: 'wall' equals: (blocks nameOf: -1).
]

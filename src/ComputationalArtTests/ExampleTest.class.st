Class {
	#name : #ExampleTest,
	#superclass : #TestCase,
	#category : #ComputationalArtTests
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Pepe Simon 6/5/2024 17:30'
}
ExampleTest >> testBad [
	self assert: 2 equals: 3.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Pepe Simon 6/5/2024 17:31'
}
ExampleTest >> testGood [
	self assert: 2 equals: 2.
]

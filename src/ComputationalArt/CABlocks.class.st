Class {
	#name : #CABlocks,
	#superclass : #Object,
	#instVars : [
		'blockNames',
		'blockColors',
		'blockNum'
	],
	#category : #ComputationalArt
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'HaMa 5/31/2024 12:03'
}
CABlocks class >> sand [
	^ 2
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'HaMa 5/31/2024 12:04'
}
CABlocks class >> stone [
	^ 3
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'HaMa 5/31/2024 12:04'
}
CABlocks class >> water [
	^ 1
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'HaMa 5/31/2024 12:34'
}
CABlocks >> blockNum [
	^ blockNum
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'HaMa 5/31/2024 13:47'
}
CABlocks >> initialize [
	"comment stating purpose of message"
	blockNames := IdentityDictionary new.
	blockNames at: 1 put: 'water'.
	blockNames at: 2 put: 'sand'.
	blockNames at: 3 put: 'stone'.
	blockColors := #('blue' 'yellow' 'grey').
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'HaMa 5/31/2024 11:21'
}
CABlocks >> nameOf: index [
	^ blockNames at: index.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'HaMa 5/31/2024 12:04'
}
CABlocks >> sand [ 
	^ 2
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'HaMa 5/31/2024 12:05'
}
CABlocks >> stone [ 
	^ 3
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'HaMa 5/31/2024 12:04'
}
CABlocks >> water [
	^ 1
]

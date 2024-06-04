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
	#'squeak_changestamp' : 'Sars 6/3/2024 23:46'
}
CABlocks >> colorOf: index [

	^ blockColors at: index.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 6/3/2024 23:46'
}
CABlocks >> initialize [

	blockNames := IdentityDictionary new.
	blockNames at: 1 put: 'water'.
	blockNames at: 2 put: 'sand'.
	blockNames at: 3 put: 'stone'.
	
	blockColors := IdentityDictionary new.
	blockColors at: 1 put: Color blue.
	blockColors at: 2 put: Color yellow.
	blockColors at: 3 put: Color gray.
	
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

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
	#'squeak_changestamp' : 'Sars 6/5/2024 15:32'
}
CABlocks >> air [ 
	^0
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
	#'squeak_changestamp' : 'Sars 6/5/2024 15:32'
}
CABlocks >> initialize [
	blockNames := IdentityDictionary new. 
	blockNames
		at: 1 put: 'water'; 
		at: 2 put: 'sand'; 
		at: 3 put: 'stone'; 
		at: 0 put: 'air'.
		
	blockColors := IdentityDictionary new.
	blockColors 
		at: 1 put: Color blue; 
		at: 2 put: Color yellow; 
		at: 3 put: Color gray; 
		at: 0 put: Color white
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

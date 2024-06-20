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
	#'squeak_changestamp' : 'Sars 6/7/2024 14:07'
}
CABlocks class >> air [
	^0
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 6/7/2024 18:15'
}
CABlocks class >> algae [
	^ 4
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 6/12/2024 20:04'
}
CABlocks class >> fire [
	^ 6
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 6/12/2024 20:04'
}
CABlocks class >> fish [
	^ 9
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'HaMa 5/31/2024 12:03'
}
CABlocks class >> sand [
	^ 2
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 6/12/2024 20:03'
}
CABlocks class >> smoke [
	^ 7
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
	#'squeak_changestamp' : 'Sars 6/12/2024 20:09'
}
CABlocks class >> tnt [
^8
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
	#'squeak_changestamp' : 'Sars 6/12/2024 20:02'
}
CABlocks class >> wood [
	^5
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
	#'squeak_changestamp' : 'Sars 6/19/2024 16:41'
}
CABlocks >> initialize [
	blockNames := IdentityDictionary new at: 0 put: 'air';
				 at: 1 put: 'water';
				 at: 2 put: 'sand';
				 at: 3 put: 'stone';
				 at: 4 put: 'algae';
				 at: 5 put: 'wood';
				 at: 6 put: 'fire';
				 at: 7 put: 'smoke';
				 at: 8 put: 'tnt';
				 at: 9 put: 'fish';
				 yourself.
	blockColors := IdentityDictionary new at: 0 put: Color white;
				 at: 1 put: Color blue;
				 at: 2 put: Color yellow;
				 at: 3 put: Color black;
				 at: 4 put: Color green;
				 at: 5 put: Color brown;
				 at: 6 put: Color red;
				 at: 7 put: Color lightGray;
				 at: 8 put: Color orange;
				 at: 9 put: Color lightRed;
				 yourself
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'HaMa 5/31/2024 11:21'
}
CABlocks >> nameOf: index [
	^ blockNames at: index.
]

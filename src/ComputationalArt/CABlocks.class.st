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
	#category : #blocks,
	#'squeak_changestamp' : 'KoPa 7/12/2024 18:21'
}
CABlocks class >> air [

	^ 0.
]

{
	#category : #blocks,
	#'squeak_changestamp' : 'KoPa 7/12/2024 18:21'
}
CABlocks class >> algae [

	^ 4.
]

{
	#category : #blocks,
	#'squeak_changestamp' : 'KoPa 7/12/2024 18:21'
}
CABlocks class >> fire [

	^ 6.
]

{
	#category : #blocks,
	#'squeak_changestamp' : 'KoPa 7/12/2024 18:21'
}
CABlocks class >> fish [

	^ 9.
]

{
	#category : #blocks,
	#'squeak_changestamp' : 'KoPa 7/12/2024 18:21'
}
CABlocks class >> sand [

	^ 2.
]

{
	#category : #blocks,
	#'squeak_changestamp' : 'KoPa 7/12/2024 18:21'
}
CABlocks class >> smoke [

	^ 7.
]

{
	#category : #blocks,
	#'squeak_changestamp' : 'KoPa 7/12/2024 18:21'
}
CABlocks class >> stone [

	^ 3.
]

{
	#category : #blocks,
	#'squeak_changestamp' : 'KoPa 7/12/2024 18:21'
}
CABlocks class >> tnt [

	^ 8.
]

{
	#category : #blocks,
	#'squeak_changestamp' : 'KoPa 7/12/2024 18:21'
}
CABlocks class >> water [

	^ 1.
]

{
	#category : #blocks,
	#'squeak_changestamp' : 'KoPa 7/12/2024 18:21'
}
CABlocks class >> wood [

	^ 5.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'KoPa 7/12/2024 18:04'
}
CABlocks >> colorAt: anIndex [

	^ blockColors at: anIndex.
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'KoPa 7/12/2024 18:22'
}
CABlocks >> initialize [
	blockNames := IdentityDictionary new
				 at: 0 put: 'air';
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
	blockColors := IdentityDictionary new
				 at: 0 put: Color white;
				 at: 1 put: Color blue;
				 at: 2 put: Color yellow;
				 at: 3 put: Color black;
				 at: 4 put: Color green;
				 at: 5 put: Color brown;
				 at: 6 put: Color red;
				 at: 7 put: Color lightGray;
				 at: 8 put: Color orange;
				 at: 9 put: Color lightRed;
				 yourself.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'KoPa 7/12/2024 18:04'
}
CABlocks >> nameAt: anIndex [
	^ blockNames at: anIndex.
]

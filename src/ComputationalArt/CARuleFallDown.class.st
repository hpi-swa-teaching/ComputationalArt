Class {
	#name : #CARuleFallDown,
	#superclass : #CARule,
	#instVars : [
		'appliesTo',
		'blocks'
	],
	#category : #ComputationalArt
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'HaMa 5/31/2024 13:43'
}
CARuleFallDown >> applyRuleWith: neighborMatrix [
	|val ihatesqueak|
	val := neighborMatrix at: 2 at: 2.
	
	(val = 0) ifTrue: [
		((neighborMatrix at: 1 at: 2) > 0) ifTrue: [
			((appliesTo at: (neighborMatrix at: 1 at: 2))=True) ifFalse: [
				^ val
			].
			^ (neighborMatrix at: 1 at: 2)
		]
	].
	(val < 1) ifTrue: [^ val].
	ihatesqueak := appliesTo at: val.
	(ihatesqueak=True) ifFalse: [
			^ val
		].
	((neighborMatrix at: 3 at: 2) = 0) ifFalse: [
			^ val
		].
	^ 0
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'HaMa 5/31/2024 12:46'
}
CARuleFallDown >> initialize [
	blocks := CABlocks new.
	appliesTo := Array new: 100.
	1 to: 100 do: [ :n |
		appliesTo at: n put: False.
	].
	appliesTo at: (CABlocks sand) put: True.
	appliesTo at: (CABlocks water) put: True.
]

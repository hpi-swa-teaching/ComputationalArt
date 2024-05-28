Class {
	#name : #CADisplay,
	#superclass : #Object,
	#instVars : [
		'viewMorph'
	],
	#category : #ComputationalArt
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Pepe Simon 5/28/2024 15:19'
}
CADisplay class >> open [
	^ CADisplay new.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Pepe Simon 5/28/2024 15:26'
}
CADisplay >> initialize [
	viewMorph := Morph new.
	viewMorph bounds: (100@100 corner: 700@700).
	viewMorph color: Color white.
	viewMorph openInWorldOrWorldlet.
]

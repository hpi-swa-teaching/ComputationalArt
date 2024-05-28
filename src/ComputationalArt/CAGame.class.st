Class {
	#name : #CAGame,
	#superclass : #Object,
	#instVars : [
		'display'
	],
	#classInstVars : [
		'display'
	],
	#category : #ComputationalArt
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Pepe Simon 5/28/2024 15:17'
}
CAGame class >> start [
	^ CAGame new.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Pepe Simon 5/28/2024 15:02'
}
CAGame >> initialize [
	display := CADisplay open.
	
]

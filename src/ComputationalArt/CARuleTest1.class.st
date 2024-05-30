Class {
	#name : #CARuleTest1,
	#superclass : #CARule,
	#category : #ComputationalArt
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 5/30/2024 14:06'
}
CARuleTest1 >> applyRuleWith: neighborMatrix [

	^ (neighborMatrix at: 2 at: 2) + 1
]

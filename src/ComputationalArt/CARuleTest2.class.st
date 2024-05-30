Class {
	#name : #CARuleTest2,
	#superclass : #CARule,
	#category : #ComputationalArt
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 5/30/2024 14:07'
}
CARuleTest2 >> applyRuleWith: neighborMatrix [

	^ (neighborMatrix at: 2 at: 2)  / 2
]

Class {
	#name : #CARuleAlgaeGrow,
	#superclass : #CARule,
	#category : #ComputationalArt
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 7/10/2024 14:50'
}
CARuleAlgaeGrow >> applyRuleWith: neighborMatrix and: newNeighborMatrix [
    |me algaeCount chance tempCell|

    me := neighborMatrix at: 2 at: 2.
 

    chance := ThreadSafeRandom value nextInt: 100.

    algaeCount := 0.

    1 to: 3 do: [:rowIndex |
        1 to: 3 do: [:colIndex |
            tempCell := newNeighborMatrix at: rowIndex at: colIndex.
            (tempCell = CABlocks algae) ifTrue: [
	           algaeCount := algaeCount + 1 
	      ].
        ].
    ].

    ((me = CABlocks water) and: (algaeCount > 0) and: (chance < 2)) ifTrue: [
        ^CABlocks algae.
    ].

    ^me
]

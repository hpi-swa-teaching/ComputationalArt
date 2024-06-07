Class {
	#name : #CARuleAlgaeGrowEX,
	#superclass : #CARule,
	#category : #ComputationalArt
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 6/7/2024 19:11'
}
CARuleAlgaeGrowEX >> applyRuleWith: neighborMatrix and: newNeighborMatrix [
    |me algaeCount chance tempCell|

    me := neighborMatrix at: 2 at: 2.
 

    chance := (1 to: 100) atRandom.

    algaeCount := 0.

    1 to: 3 do: [:rowIndex |
        1 to: 3 do: [:colIndex |
            tempCell := newNeighborMatrix at: rowIndex at: colIndex.
            (tempCell = CABlocks algae) ifTrue: [
	           algaeCount := algaeCount + 1 
	      ].
        ].
    ].

    ((me = CABlocks water) and: (algaeCount > 0) and: (chance < 5)) ifTrue: [
        ^CABlocks algae.
    ].

    ^me
]

Class {
	#name : #CARuleAlgaeDieEX,
	#superclass : #CARule,
	#category : #ComputationalArt
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 6/7/2024 19:12'
}
CARuleAlgaeDieEX >> applyRuleWith: neighborMatrix and: newNeighborMatrix [
    |me waterCount chance tempCell|

    me := neighborMatrix at: 2 at: 2.
 

    chance := (1 to: 100) atRandom.

    waterCount := 1.

    1 to: 3 do: [:rowIndex |
        1 to: 3 do: [:colIndex |
            tempCell := newNeighborMatrix at: rowIndex at: colIndex.
            (tempCell = CABlocks water) ifTrue: [
	           waterCount := waterCount +1 
	      ].
        ].
    ].

    ((me = CABlocks algae) and: ((waterCount * chance) < 20)) ifTrue: [
        ^CABlocks water.
    ].

    ^me
]

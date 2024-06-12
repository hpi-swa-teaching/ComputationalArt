Class {
	#name : #CARuleFallDownEX,
	#superclass : #CARule,
	#category : #ComputationalArt
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 6/7/2024 18:14'
}
CARuleFallDownEX >> applyRuleWith: neighborMatrix and: newNeighborMatrix [
    |aboveMe me belowMe fallingBlocks |

    aboveMe := neighborMatrix at: 1 at: 2.
    me := neighborMatrix at: 2 at: 2.
    belowMe := neighborMatrix at: 3 at: 2.

    fallingBlocks := OrderedCollection new
        add: CABlocks sand; 
        add: CABlocks water;
        add: CABlocks algae;
        yourself.

    ((me = CABlocks air) and: [fallingBlocks includes: aboveMe]) ifTrue: [
        ^aboveMe
    ].

    ((fallingBlocks includes: me) and: [belowMe = CABlocks air]) ifTrue: [
        ^CABlocks air
    ].

    ^me
]
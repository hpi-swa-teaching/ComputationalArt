Class {
	#name : #CARuleSinkEX,
	#superclass : #CARule,
	#category : #ComputationalArt
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 6/7/2024 18:40'
}
CARuleSinkEX >> applyRuleWith: neighborMatrix and: newNeighborMatrix [
    |aboveMe me belowMe sinkingBlocks |

    aboveMe := neighborMatrix at: 1 at: 2.
    me := neighborMatrix at: 2 at: 2.
    belowMe := neighborMatrix at: 3 at: 2.

    sinkingBlocks := OrderedCollection new
        add: CABlocks sand; 
        yourself.

    ((me = CABlocks water) and: [sinkingBlocks includes: aboveMe]) ifTrue: [
        ^aboveMe
    ].

    ((sinkingBlocks includes: me) and: [belowMe = CABlocks water]) ifTrue: [
        ^CABlocks water
    ].

    ^me
]

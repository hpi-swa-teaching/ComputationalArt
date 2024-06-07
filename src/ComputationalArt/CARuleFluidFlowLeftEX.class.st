Class {
	#name : #CARuleFluidFlowLeftEX,
	#superclass : #CARule,
	#instVars : [
		'appliesTo',
		'blocks'
	],
	#category : #ComputationalArt
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 6/7/2024 17:11'
}
CARuleFluidFlowLeftEX >> applyRuleWith: neighborMatrix and: newNeighborMatrix [
    |me rightMe belowRightMe leftMe futureLeftMe solidBlocks flowingBlocks chance|

    me := neighborMatrix at: 2 at: 2.
    rightMe := neighborMatrix at: 2 at: 3.
    leftMe := neighborMatrix at: 2 at: 1.
    belowRightMe := neighborMatrix at: 3 at: 3.
    futureLeftMe := newNeighborMatrix at: 2 at: 1.

    chance := (1 to: 100) atRandom.

    solidBlocks := OrderedCollection new
        add: CABlocks sand;
        add: CABlocks water;
        yourself.

    flowingBlocks := OrderedCollection new
        add: CABlocks water;
        yourself.

    ((((flowingBlocks includes: rightMe) 
    and: (solidBlocks includes: belowRightMe)) 
    and: (me = CABlocks air)) 
    and: (chance < 20)) 
    ifTrue: [
        ^rightMe
    ].

    ((leftMe = CABlocks air) and: (flowingBlocks includes: futureLeftMe)) ifTrue: [
        ^CABlocks air
    ]. 

    ^me
]

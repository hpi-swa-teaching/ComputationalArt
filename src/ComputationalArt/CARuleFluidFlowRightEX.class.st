Class {
	#name : #CARuleFluidFlowRightEX,
	#superclass : #CARule,
	#category : #ComputationalArt
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 6/7/2024 17:11'
}
CARuleFluidFlowRightEX >> applyRuleWith: neighborMatrix and: newNeighborMatrix [
    |me rightMe belowMe leftMe futureLeftMe solidBlocks flowingBlocks chance|

    me := neighborMatrix at: 2 at: 2.
    rightMe := neighborMatrix at: 2 at: 3.
    leftMe := neighborMatrix at: 2 at: 1.
    belowMe := neighborMatrix at: 3 at: 2.
    futureLeftMe := newNeighborMatrix at: 2 at: 1.

    chance := (1 to: 100) atRandom.

    solidBlocks := OrderedCollection new
        add: CABlocks sand;
        add: CABlocks water;
        yourself.

    flowingBlocks := OrderedCollection new
        add: CABlocks water;
        yourself.

    ((((flowingBlocks includes: me) 
    and: (solidBlocks includes: belowMe)) 
    and: (rightMe = CABlocks air)) 
    and: (chance < 20)) 
    ifTrue: [
        ^CABlocks air
    ].

    ((flowingBlocks includes: leftMe) and: (futureLeftMe = CABlocks air)) ifTrue: [
        ^leftMe
    ]. 

    ^me
]

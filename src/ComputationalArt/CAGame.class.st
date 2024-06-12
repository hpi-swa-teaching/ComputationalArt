Class {
	#name : #CAGame,
	#superclass : #Object,
	#instVars : [
		'screen',
		'ruleSet',
		'ruler',
		'grid',
		'cellViewMorph'
	],
	#classInstVars : [
		'display'
	],
	#category : #ComputationalArt
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 6/12/2024 13:05'
}
CAGame >> start [
|gameloop|

screen := CADisplay open.

cellViewMorph := screen getViewMorph.

ruleSet := OrderedCollection new
    add: CARuleFallDownEX new;
    add: CARuleSinkEX new;
    add: CARuleFluidFlowLeftEX new;
    add: CARuleFluidFlowRightEX new;
    add: CARulePyramidLeftEX new;
    add: CARulePyramidRightEX new;
    add: CARuleAlgaeDieEX new;
    add: CARuleAlgaeGrowEX new;
    yourself.

ruler := CARuler new.

grid := CAGrid new.
CAGrid fill: grid.

screen attachGrid: grid.


       


gameloop:= [
    [true] whileTrue: [
        Transcript show: 'This message is shown every 2 seconds.'; cr.
        (Delay forSeconds: 0.5) wait.
        grid := ruler applyRules: ruleSet to: grid.
        screen step.
    ]
] fork.




]

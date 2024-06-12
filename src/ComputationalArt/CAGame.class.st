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
	#'squeak_changestamp' : 'Sars 6/12/2024 13:40'
}
CAGame >> start [
|maxIterations iterationCount gameloop|

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

maxIterations := 400.
iterationCount := 0.

gameloop := [
    [iterationCount < maxIterations] whileTrue: [
        (Delay forSeconds: 0.5) wait.
        grid := ruler applyRules: ruleSet to: grid.
        screen step.
        iterationCount := iterationCount + 1.
    ].
    Transcript show: 'Game loop terminated after ', maxIterations printString, ' iterations.'; cr.
] fork.

]

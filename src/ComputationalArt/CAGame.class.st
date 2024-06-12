Class {
	#name : #CAGame,
	#superclass : #Object,
	#instVars : [
		'screen',
		'ruleSet',
		'ruler',
		'grid',
		'cellViewMorph',
		'frameDelay',
		'isRunning'
	],
	#classInstVars : [
		'display'
	],
	#category : #ComputationalArt
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 6/12/2024 14:19'
}
CAGame >> setFrameDelay: seconds [

	frameDelay := seconds
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 6/12/2024 15:31'
}
CAGame >> skipAhead: stepCount [ 

	stepCount timesRepeat: [grid := ruler applyRules: ruleSet to: grid.].
	
	
	screen step
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 6/12/2024 22:08'
}
CAGame >> start [
	| maxIterations iterationCount gameloop |
	isRunning := true.
	frameDelay := 0.5.
	screen := CADisplay new.
	cellViewMorph := screen getViewMorph.
	ruleSet := OrderedCollection new add: CARuleFallDownEX new;
				 add: CARuleSinkEX new;
				 add: CARuleFluidFlowLeftEX new;
				 add: CARuleFluidFlowRightEX new;
				 add: CARulePyramidLeftEX new;
				 add: CARulePyramidRightEX new;
				 add: CARuleAlgaeDieEX new;
				 add: CARuleAlgaeGrowEX new;
				 add: CARuleRiseEX new;
				 add: CARuleGasFlowLeftEX new;
				 add: CARuleGasFlowRightEX new;
				 add: CARuleGasDisappearEX new;
				 add: CARuleFireOutEX new;
				add: CARuleBurnEX new;
				 yourself.
	ruler := CARuler new.
	grid := CAGrid new.
	CAGrid fill: grid.
	screen attachGrid: grid.
	maxIterations := 200.
	iterationCount := 0.
	gameloop := [[iterationCount < maxIterations]
				whileTrue: [(Delay forSeconds: frameDelay) wait.
					isRunning
						ifTrue: [grid := ruler applyRules: ruleSet to: grid.
							screen step].
					iterationCount := iterationCount + 1].
			Transcript show: 'Game loop terminated after ' , maxIterations printString , ' iterations.';
				 cr] fork
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 6/12/2024 15:01'
}
CAGame >> toggleRunning [
	isRunning := isRunning not.
]

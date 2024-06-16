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
		'isRunning',
		'activeCellType',
		'brushSize'
	],
	#classInstVars : [
		'display'
	],
	#category : #ComputationalArt
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 6/16/2024 18:00'
}
CAGame >> putCellAtRow: row andCol: col [ 
	| originRow originCol placeRow placeCol |
	originRow := row - brushSize.
	originCol := col - brushSize.
	1
		to: brushSize * 2 - 1
		do: [:rowIndex | 1
				to: brushSize * 2 - 1
				do: [:colIndex | 
					placeRow := originRow + rowIndex.
					placeCol := originCol + colIndex.
					(placeRow > 0
							and: placeRow < 101
							and: placeCol > 0
							and: placeCol < 101)
						ifTrue: [grid
								putCell: activeCellType
								atRow: placeRow
								andCol: placeCol]]].
	isRunning
		ifFalse: [screen step]
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 6/16/2024 14:19'
}
CAGame >> setActiveCellTypeTo: cellType [

	activeCellType := cellType
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 6/16/2024 17:22'
}
CAGame >> setBrushSize: size [
	brushSize := size
]

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
	#'squeak_changestamp' : 'Sars 6/16/2024 17:22'
}
CAGame >> start [
	| maxIterations iterationCount gameloop |
	isRunning := true.
	frameDelay := 0.5.
	activeCellType := CABlocks tnt.
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
				 add: CARuleFishSwimLeftEX new;
				 add: CARuleFishSwimRightEX new;
				 add: CARuleFishSwimUpEX new;
				 add: CARuleFishSwimDownEX new;
				 add: CARuleFishDieEX new;
				 add: CARuleTntSpreadEX new withOccurrences: 1;
				 yourself.
	ruler := CARuler new.
	brushSize := 1.
	grid := CAGrid new.
	screen attachGame: self.
	CAGrid fillTNTest: grid.
	screen attachGrid: grid.
	screen step.
	maxIterations := 100.
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

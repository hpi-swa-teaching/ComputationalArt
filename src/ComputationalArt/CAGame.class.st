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
	#'squeak_changestamp' : 'Sars 6/16/2024 20:52'
}
CAGame >> brushSize: aSize [
	brushSize := aSize
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 6/16/2024 20:51'
}
CAGame >> frameDelay: aSecondCount [
	
	frameDelay := aSecondCount
	
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 6/19/2024 16:20'
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
	screen step
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
	#'squeak_changestamp' : 'Sars 6/16/2024 20:50'
}
CAGame >> skipAhead: stepCount [ 

	stepCount timesRepeat: [grid := ruler applyRules: ruleSet to: grid.].
	screen step
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 6/23/2024 15:56'
}
CAGame >> start [
	| maxIterations iterationCount gameloop ui|
	isRunning := true.
	frameDelay := 0.2.
	brushSize := 1.
	ruler := CARuler new.
	activeCellType := CABlocks tnt.
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
	grid := CAGrid new.
	CAGrid fill: grid.
	screen := CADisplay new.
	screen attachedGame: self.
	screen attachedGrid: grid.
	cellViewMorph := screen viewMorph.
	
	
	ui := CAOverlay new.
	ui position: 130@130.
	ui game: self.
	cellViewMorph addMorph: ui.
	cellViewMorph position: 750@250.
	
	screen step.
	maxIterations := 300.
	iterationCount := 0.
	gameloop := [[iterationCount < maxIterations]
				whileTrue: [(Delay forSeconds: frameDelay) wait.
					isRunning
						ifTrue: [grid := ruler applyRules: ruleSet to: grid.
							screen step. iterationCount := iterationCount + 1].
					].
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

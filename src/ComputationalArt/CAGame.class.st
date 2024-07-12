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
		'brushSize',
		'brushActive'
	],
	#classInstVars : [
		'display'
	],
	#category : #ComputationalArt
}

{
	#category : #constants,
	#'squeak_changestamp' : 'KoPa 7/12/2024 19:19'
}
CAGame class >> brushSize [

	^ 1.
]

{
	#category : #constants,
	#'squeak_changestamp' : 'KoPa 7/12/2024 19:20'
}
CAGame class >> frameDelay [

	^ 0.01.
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'KoPa 7/12/2024 19:23'
}
CAGame class >> initializeRuleSet [

	^ OrderedCollection new
				 add: CARuleFallDown new;
				 add: CARuleSink new;
				 add: CARuleFluidFlowLeft new;
				 add: CARuleFluidFlowRight new;
				 add: CARulePyramidLeft new;
				 add: CARulePyramidRight new;
				 add: CARuleAlgaeDie new;
				 add: CARuleAlgaeGrow new;
				 add: CARuleRise new;
				 add: CARuleGasFlowLeft new;
				 add: CARuleGasFlowRight new;
				 add: CARuleGasDisappear new;
				 add: CARuleFireOut new;
				 add: CARuleBurn new;
				 add: CARuleFishSwimLeft new;
				 add: CARuleFishSwimRight new;
				 add: CARuleFishSwimUp new;
				 add: CARuleFishSwimDown new;
				 add: CARuleFishDie new;
				 add: CARuleTntSpread new;
				 add: CARuleStonerLife new;
				 yourself.
]

{
	#category : #constants,
	#'squeak_changestamp' : 'KoPa 7/12/2024 20:41'
}
CAGame class >> iterationStart [

	^ 0.
]

{
	#category : #constants,
	#'squeak_changestamp' : 'KoPa 7/12/2024 20:42'
}
CAGame class >> maxIterations [

	200.
]

{
	#category : #constants,
	#'squeak_changestamp' : 'KoPa 7/12/2024 20:41'
}
CAGame class >> viewMorphPosition [

	^ 750 @ 250.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'KoPa 7/12/2024 19:07'
}
CAGame >> activeCellType [

	^ activeCellType.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'KoPa 7/12/2024 19:07'
}
CAGame >> brushActive [

	^ brushActive.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'KoPa 7/12/2024 19:08'
}
CAGame >> brushSize: aSize [

	brushSize := aSize.
]

{
	#category : #functional,
	#'squeak_changestamp' : 'KoPa 7/12/2024 19:08'
}
CAGame >> clear [

	CAGrid clear: grid.
	screen step.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'KoPa 7/12/2024 19:08'
}
CAGame >> frameDelay: aSecondCount [
	
	frameDelay := aSecondCount.
	
]

{
	#category : #functional,
	#'squeak_changestamp' : 'KoPa 7/12/2024 20:33'
}
CAGame >> putCellAtRow: aRow andCol: aCol [

	| originRow originCol placeRow placeCol |
	originRow := aRow - brushSize.
	originCol := aCol - brushSize.
	1 to: brushSize * 2 - 1
		do: [:rowIndex | 
			1 to: brushSize * 2 - 1
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
								andCol: placeCol.]]].
	screen step.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'KoPa 7/12/2024 19:13'
}
CAGame >> setActiveCellTypeTo: aType [

	activeCellType := aType.
]

{
	#category : #functional,
	#'squeak_changestamp' : 'KoPa 7/12/2024 20:33'
}
CAGame >> skipAhead: aStepCount [ 

	aStepCount timesRepeat: [ruler applyRules: ruleSet to: grid.].
	screen step.
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'KoPa 7/12/2024 20:59'
}
CAGame >> start [

	| maxIterations iterationCount gameloop ui |
	isRunning := true.
	frameDelay := CAGame frameDelay.
	brushSize := CAGame brushSize.
	brushActive := false.
	ruler := CARuler new.
	activeCellType := CABlocks tnt.
	ruleSet := CAGame initializeRuleSet.
	grid := CAGrid new.
	screen := CADisplay new.
	screen attachedGame: self.
	screen attachedGrid: grid.
	cellViewMorph := screen viewMorph.
	ui := CAOverlay new.
	ui position: CAOverlay uiPosition.
	ui game: self.
	cellViewMorph addMorph: ui.
	cellViewMorph position: CAGame viewMorphPosition.
	screen step.
	maxIterations := 200.
	iterationCount := 0.
	
	gameloop := [[iterationCount < maxIterations]
				whileTrue: [
					(Delay forSeconds: frameDelay) wait.
					isRunning ifTrue: [
							ruler applyRules: ruleSet to: grid.
							screen step.
							iterationCount := iterationCount + 1.]]] fork.
]

{
	#category : #toggle,
	#'squeak_changestamp' : 'KoPa 7/12/2024 19:10'
}
CAGame >> toggleBrushActive [

	brushActive := brushActive not.
]

{
	#category : #toggle,
	#'squeak_changestamp' : 'KoPa 7/12/2024 19:11'
}
CAGame >> toggleRunning [

	isRunning := isRunning not.
]

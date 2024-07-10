Class {
	#name : #CARulesTest,
	#superclass : #TestCase,
	#instVars : [
		'grid',
		'ruleSet',
		'ruler'
	],
	#category : #ComputationalArtTests
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 6/23/2024 17:33'
}
CARulesTest >> setUp [
	grid := CAGrid new.
	ruler := CARuler new.
	ruleSet := OrderedCollection new.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 6/24/2024 10:49'
}
CARulesTest >> tearDown [
	grid := nil.
	ruler := nil.
	ruleSet := nil
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 7/10/2024 16:37'
}
CARulesTest >> testRuleFallDown [
	ruleSet add: CARuleFallDown new.
	grid
		putCell: CABlocks water
		atRow: 10
		andCol: 10.
	grid
		putCell: CABlocks algae
		atRow: 10
		andCol: 20.
	grid
		putCell: CABlocks fire
		atRow: 10
		andCol: 30.
	grid
		putCell: CABlocks fish
		atRow: 10
		andCol: 40.
	ruler applyRules: ruleSet to: grid.
	self
		assert: (grid getCellAtRow: 10 andCol: 10)
		equals: CABlocks air.
	self
		assert: (grid getCellAtRow: 10 andCol: 20)
		equals: CABlocks air.
	self
		assert: (grid getCellAtRow: 10 andCol: 30)
		equals: CABlocks air.
	self
		assert: (grid getCellAtRow: 10 andCol: 40)
		equals: CABlocks air.
	self
		assert: (grid getCellAtRow: 11 andCol: 10)
		equals: CABlocks water.
	self
		assert: (grid getCellAtRow: 11 andCol: 20)
		equals: CABlocks algae.
	self
		assert: (grid getCellAtRow: 11 andCol: 30)
		equals: CABlocks fire.
	self
		assert: (grid getCellAtRow: 11 andCol: 40)
		equals: CABlocks fish.
	ruleSet removeAll.
	CAGrid clear: grid
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 7/10/2024 16:34'
}
CARulesTest >> testRuleRise [
	ruleSet add: CARuleRise new.
	grid
		putCell: CABlocks smoke
		atRow: 10
		andCol: 10.
	ruler applyRules: ruleSet to: grid.
	self
		assert: (grid getCellAtRow: 10 andCol: 10)
		equals: CABlocks air.
	self
		assert: (grid getCellAtRow: 9 andCol: 10)
		equals: CABlocks smoke.
	ruleSet removeAll.
	CAGrid clear: grid
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 7/10/2024 16:33'
}
CARulesTest >> testRuleSink [
	ruleSet add: CARuleSink new.
	grid
		putCell: CABlocks sand
		atRow: 10
		andCol: 10.
	grid
		putCell: CABlocks sand
		atRow: 10
		andCol: 20.
	grid
		putCell: CABlocks fire
		atRow: 11
		andCol: 10.
	grid
		putCell: CABlocks water
		atRow: 11
		andCol: 20.
	ruler applyRules: ruleSet to: grid.
	self
		assert: (grid getCellAtRow: 10 andCol: 10)
		equals: CABlocks fire.
	self
		assert: (grid getCellAtRow: 10 andCol: 20)
		equals: CABlocks water.
	self
		assert: (grid getCellAtRow: 11 andCol: 10)
		equals: CABlocks sand.
	self
		assert: (grid getCellAtRow: 11 andCol: 20)
		equals: CABlocks sand.
	ruleSet removeAll.
	CAGrid clear: grid
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 6/24/2024 11:25'
}
CARulesTest >> testRulesFluids [
	| newGrid airCount waterCount |
	airCount := 0.
	waterCount := 0.
	ruleSet add: CARuleFluidFlowLeft new;
		 add: CARuleFluidFlowRight new;
		 add: CARuleGasFlowLeft new;
		 add: CARuleGasFlowRight new.
	grid
		putCell: CABlocks water
		atRow: 10
		andCol: 10;
		
		putCell: CABlocks water
		atRow: 10
		andCol: 20;
		
		putCell: CABlocks water
		atRow: 10
		andCol: 30.
	10
		timesRepeat: [newGrid := ruler applyRules: ruleSet to: grid].
	1
		to: 100
		do: [:rowIndex | 1
				to: 100
				do: [:colIndex | 
					(grid getCellAtRow: rowIndex andCol: colIndex)
							= CABlocks air
						ifTrue: [airCount := airCount + 1].
					(grid getCellAtRow: rowIndex andCol: colIndex)
							= CABlocks water
						ifTrue: [waterCount := waterCount + 1]]].
	self assert: waterCount equals: 3.
	self assert: airCount equals: (10000 - 3). ruleSet removeAll.
	CAGrid clear: grid
]

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
	#category : #'initialize-release',
	#'squeak_changestamp' : 'KoPa 7/12/2024 19:59'
}
CARulesTest >> setUp [

	grid := CAGrid new.
	ruler := CARuler new.
	ruleSet := OrderedCollection new.
]

{
	#category : #functional,
	#'squeak_changestamp' : 'KoPa 7/12/2024 19:59'
}
CARulesTest >> tearDown [

	grid := nil.
	ruler := nil.
	ruleSet := nil.
]

{
	#category : #testing,
	#'squeak_changestamp' : 'KoPa 7/12/2024 23:49'
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
		assert: (grid cellAtRow: 10 andCol: 10)
		equals: CABlocks air.
	self
		assert: (grid cellAtRow: 10 andCol: 20)
		equals: CABlocks air.
	self
		assert: (grid cellAtRow: 10 andCol: 30)
		equals: CABlocks air.
	self
		assert: (grid cellAtRow: 10 andCol: 40)
		equals: CABlocks air.
	self
		assert: (grid cellAtRow: 11 andCol: 10)
		equals: CABlocks water.
	self
		assert: (grid cellAtRow: 11 andCol: 20)
		equals: CABlocks algae.
	self
		assert: (grid cellAtRow: 11 andCol: 30)
		equals: CABlocks fire.
	self
		assert: (grid cellAtRow: 11 andCol: 40)
		equals: CABlocks fish.
	ruleSet removeAll.
	CAGrid clear: grid.
]

{
	#category : #testing,
	#'squeak_changestamp' : 'KoPa 7/12/2024 23:49'
}
CARulesTest >> testRuleRise [

	ruleSet add: CARuleRise new.
	grid
		putCell: CABlocks smoke
		atRow: 10
		andCol: 10.
	ruler applyRules: ruleSet to: grid.
	self
		assert: (grid cellAtRow: 10 andCol: 10)
		equals: CABlocks air.
	self
		assert: (grid cellAtRow: 9 andCol: 10)
		equals: CABlocks smoke.
	ruleSet removeAll.
	CAGrid clear: grid.
]

{
	#category : #testing,
	#'squeak_changestamp' : 'KoPa 7/12/2024 23:49'
}
CARulesTest >> testRuleSink [

	ruleSet add: CARuleSink new.
	grid
		putCell: CABlocks sand
		atRow: 10
		andCol: 10;
		
		putCell: CABlocks sand
		atRow: 10
		andCol: 20;
		
		putCell: CABlocks fire
		atRow: 11
		andCol: 10;
		
		putCell: CABlocks water
		atRow: 11
		andCol: 20.
	ruler applyRules: ruleSet to: grid.
	self
		assert: (grid cellAtRow: 10 andCol: 10)
		equals: CABlocks fire.
	self
		assert: (grid cellAtRow: 10 andCol: 20)
		equals: CABlocks water.
	self
		assert: (grid cellAtRow: 11 andCol: 10)
		equals: CABlocks sand.
	self
		assert: (grid cellAtRow: 11 andCol: 20)
		equals: CABlocks sand.
	ruleSet removeAll.
	CAGrid clear: grid.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'KoPa 7/12/2024 23:49'
}
CARulesTest >> testRulesAlgae [
	| algaeCount waterCount airCount |
	airCount := 0.
	algaeCount := 0.
	waterCount := 0.
	ruleSet add: CARuleAlgaeDie new;
		 add: CARuleAlgaeGrow new.
	grid
		putCell: CABlocks water
		atRow: 10
		andCol: 10;
		
		putCell: CABlocks algae
		atRow: 10
		andCol: 11;
		
		putCell: CABlocks water
		atRow: 10
		andCol: 20;
		
		putCell: CABlocks algae
		atRow: 10
		andCol: 21;
		
		putCell: CABlocks water
		atRow: 10
		andCol: 30;
		
		putCell: CABlocks algae
		atRow: 10
		andCol: 31.
	10
		timesRepeat: [ruler applyRules: ruleSet to: grid].
	1
		to: 100
		do: [:rowIndex | 1
				to: 100
				do: [:colIndex | 
					(grid cellAtRow: rowIndex andCol: colIndex)
							= CABlocks air
						ifTrue: [airCount := airCount + 1].
					(grid cellAtRow: rowIndex andCol: colIndex)
							= CABlocks water
						ifTrue: [waterCount := waterCount + 1].
					(grid cellAtRow: rowIndex andCol: colIndex)
							= CABlocks algae
						ifTrue: [algaeCount := algaeCount + 1]]].
	self assert: waterCount + algaeCount equals: 6.
	self assert: airCount equals: 10000 - 6.
	ruleSet removeAll.
	CAGrid clear: grid
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'KoPa 7/12/2024 23:49'
}
CARulesTest >> testRulesFish [
	| fishCount waterCount airCount |
	airCount := 0.
	fishCount := 0.
	waterCount := 0.
	ruleSet add: CARuleFishSwimUp new;
		 add: CARuleFishSwimLeft new;
		 add: CARuleFishSwimRight new;
		 add: CARuleFishSwimDown new.
	grid
		putCell: CABlocks water
		atRow: 10
		andCol: 10;
		
		putCell: CABlocks water
		atRow: 10
		andCol: 11;
		
		putCell: CABlocks water
		atRow: 10
		andCol: 12;
		
		putCell: CABlocks water
		atRow: 11
		andCol: 10;
		
		putCell: CABlocks fish
		atRow: 11
		andCol: 11;
		
		putCell: CABlocks water
		atRow: 11
		andCol: 12;
		
		putCell: CABlocks water
		atRow: 12
		andCol: 10;
		
		putCell: CABlocks water
		atRow: 12
		andCol: 11;
		
		putCell: CABlocks water
		atRow: 12
		andCol: 12.
	10
		timesRepeat: [ ruler applyRules: ruleSet to: grid].
	1
		to: 100
		do: [:rowIndex | 1
				to: 100
				do: [:colIndex | 
					(grid cellAtRow: rowIndex andCol: colIndex)
							= CABlocks air
						ifTrue: [airCount := airCount + 1].
					(grid cellAtRow: rowIndex andCol: colIndex)
							= CABlocks water
						ifTrue: [waterCount := waterCount + 1].
					(grid cellAtRow: rowIndex andCol: colIndex)
							= CABlocks fish
						ifTrue: [fishCount := fishCount + 1]]].
	self assert: waterCount equals: 8.
	self assert: fishCount equals: 1.
	self assert: airCount equals: 10000 - 9.
	ruleSet removeAll.
	CAGrid clear: grid
]

{
	#category : #testing,
	#'squeak_changestamp' : 'KoPa 7/12/2024 23:49'
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
	10 timesRepeat: [newGrid := ruler applyRules: ruleSet to: grid.].
	1 to: 100
		do: [:rowIndex | 
			1 to: 100
				do: [:colIndex | 
					(grid cellAtRow: rowIndex andCol: colIndex)
							= CABlocks air
						ifTrue: [airCount := airCount + 1.].
					(grid cellAtRow: rowIndex andCol: colIndex)
							= CABlocks water
						ifTrue: [waterCount := waterCount + 1.]]].
	self assert: waterCount equals: 3.
	self assert: airCount equals: (10000 - 3). ruleSet removeAll.
	CAGrid clear: grid.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'KoPa 7/12/2024 23:49'
}
CARulesTest >> testRulesLife [
	| airCount stoneCount |
	airCount := 0.
	stoneCount := 0.
	ruleSet add: CARuleStonerLife new.
	grid
		putCell: CABlocks stone
		atRow: 10
		andCol: 10;
		
		putCell: CABlocks stone
		atRow: 10
		andCol: 11;
		
		putCell: CABlocks stone
		atRow: 10
		andCol: 12;
		
		putCell: CABlocks stone
		atRow: 9
		andCol: 12;
		
		putCell: CABlocks stone
		atRow: 8
		andCol: 11.
	40
		timesRepeat: [ruler applyRules: ruleSet to: grid].
	1
		to: 100
		do: [:rowIndex | 1
				to: 100
				do: [:colIndex | 
					(grid cellAtRow: rowIndex andCol: colIndex)
							= CABlocks air
						ifTrue: [airCount := airCount + 1].
					(grid cellAtRow: rowIndex andCol: colIndex)
							= CABlocks stone
						ifTrue: [stoneCount := stoneCount + 1]]].
	self
		assert: (grid cellAtRow: 20 andCol: 20)
		equals: CABlocks stone.
	self
		assert: (grid cellAtRow: 20 andCol: 21)
		equals: CABlocks stone.
	self
		assert: (grid cellAtRow: 20 andCol: 22)
		equals: CABlocks stone.
	self
		assert: (grid cellAtRow: 19 andCol: 22)
		equals: CABlocks stone.
	self
		assert: (grid cellAtRow: 18 andCol: 21)
		equals: CABlocks stone.
	self assert: stoneCount equals: 5.
	self assert: airCount equals: 10000 - 5.
	ruleSet removeAll.
	CAGrid clear: grid
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'KoPa 7/12/2024 23:49'
}
CARulesTest >> testRulesSand [
	| airCount sandCount |
	airCount := 0.
	sandCount := 0.
	ruleSet add: CARulePyramidLeft new;
		 add: CARulePyramidRight new;
		 add: CARuleFallDown new.
	grid
		putCell: CABlocks sand
		atRow: 98
		andCol: 10;
		
		putCell: CABlocks sand
		atRow: 99
		andCol: 10;
		
		putCell: CABlocks sand
		atRow: 100
		andCol: 10.
	10
		timesRepeat: [ruler applyRules: ruleSet to: grid].
	1
		to: 100
		do: [:rowIndex | 1
				to: 100
				do: [:colIndex | 
					(grid cellAtRow: rowIndex andCol: colIndex)
							= CABlocks air
						ifTrue: [airCount := airCount + 1].
					(grid cellAtRow: rowIndex andCol: colIndex)
							= CABlocks sand
						ifTrue: [sandCount := sandCount + 1]]].
	self assert: sandCount equals: 3.
	self assert: airCount equals: 10000 - 3.
	ruleSet removeAll.
	CAGrid clear: grid
]

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
	#'squeak_changestamp' : 'Sars 6/23/2024 18:15'
}
CARulesTest >> testRuleFallDown [
|newGrid|
	
	ruleSet add: CARuleFallDownEX new.
	grid putCell: CABlocks water atRow: 10 andCol: 10.
	grid putCell: CABlocks algae atRow: 10 andCol: 20.
	grid putCell: CABlocks fire atRow: 10 andCol: 30.
	grid putCell: CABlocks fish atRow: 10 andCol: 40.
	
	newGrid := ruler applyRules: ruleSet to: grid.
	
	self assert: ((newGrid getCellAtRow: 10 andCol: 10) = CABlocks air).
	self assert: ((newGrid getCellAtRow: 10 andCol: 20) = CABlocks air).
	self assert: ((newGrid getCellAtRow: 10 andCol: 30) = CABlocks air).
	self assert: ((newGrid getCellAtRow: 10 andCol: 40) = CABlocks air).
	
	self assert: ((newGrid getCellAtRow: 11 andCol: 10) = CABlocks water).
	self assert: ((newGrid getCellAtRow: 11 andCol: 20) = CABlocks algae).
	self assert: ((newGrid getCellAtRow: 11 andCol: 30) = CABlocks fire).
	self assert: ((newGrid getCellAtRow: 11 andCol: 40) = CABlocks fish).
	
	ruleSet removeAll.
	CAGrid clear: grid.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 6/23/2024 18:21'
}
CARulesTest >> testRuleRise [
|newGrid|
	
	ruleSet add: CARuleRiseEX new.
	grid putCell: CABlocks smoke atRow: 10 andCol: 10.
	
	newGrid := ruler applyRules: ruleSet to: grid.
	
	self assert: ((newGrid getCellAtRow: 10 andCol: 10) = CABlocks air).
	self assert: ((newGrid getCellAtRow: 9 andCol: 10) = CABlocks smoke).

	ruleSet removeAll.
	CAGrid clear: grid.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 6/23/2024 18:31'
}
CARulesTest >> testRuleSink [
	|newGrid|
	
	ruleSet add: CARuleSinkEX new.
	grid putCell: CABlocks sand atRow: 10 andCol: 10.
	grid putCell: CABlocks sand atRow: 10 andCol: 20.
	grid putCell: CABlocks fire atRow: 11 andCol: 10.
	grid putCell: CABlocks water atRow: 11 andCol: 20.
	
	newGrid := ruler applyRules: ruleSet to: grid.
	
	self assert: ((newGrid getCellAtRow: 10 andCol: 10) = CABlocks fire).
	self assert: ((newGrid getCellAtRow: 10 andCol: 20) = CABlocks water).
	
	self assert: ((newGrid getCellAtRow: 11 andCol: 10) = CABlocks sand).
	self assert: ((newGrid getCellAtRow: 11 andCol: 20) = CABlocks sand).
	
	ruleSet removeAll.
	CAGrid clear: grid.
]

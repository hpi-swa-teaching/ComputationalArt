Class {
	#name : #CAGridTest,
	#superclass : #TestCase,
	#instVars : [
		'grid'
	],
	#category : #ComputationalArtTests
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'HaMa 6/20/2024 10:52'
}
CAGridTest >> expectedFailures [
	^ {#testFillEmptyFail}
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'HaMa 6/20/2024 10:37'
}
CAGridTest >> setUp [
	grid := CAGrid new.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'HaMa 6/20/2024 10:37'
}
CAGridTest >> tearDown [
	grid := nil.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'HaMa 6/20/2024 10:58'
}
CAGridTest >> testDeepCopy [
	| numCols numRows copiedGrid|
	numCols := grid numCols.
	numRows := grid numRows.
	CAGrid fill: grid.
	copiedGrid := grid deepcopy.
	1
		to: numRows
		do: [:rowIndex | 1
				to: numCols
				do: [:colIndex | self assert: (copiedGrid getCellAtRow: rowIndex andCol: colIndex) equals: (grid getCellAtRow: rowIndex andCol: colIndex)]].
	copiedGrid putCell:-1 atRow: 1 andCol: 1.
	self assert: -1 < (grid getCellAtRow: 1 andCol: 1).
	CAGrid clear: grid.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'HaMa 6/20/2024 10:53'
}
CAGridTest >> testFillEmptyFail [
	| numCols numRows |
	numCols := grid numCols.
	numRows := grid numRows.
	CAGrid fill: grid.
	1
		to: numRows
		do: [:rowIndex | 1
				to: numCols
				do: [:colIndex | self assert: CABlocks air equals: (grid getCellAtRow: rowIndex andCol: colIndex)]].
	CAGrid clear: grid.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'HaMa 6/20/2024 11:14'
}
CAGridTest >> testFillStone [
	| numCols numRows |
	numCols := grid numCols.
	numRows := grid numRows.
	CAGrid fillStone: grid.
	1
		to: numRows
		do: [:rowIndex | 1
				to: numCols
				do: [:colIndex | self assert: CABlocks stone equals: (grid getCellAtRow: rowIndex andCol: colIndex)]].
	CAGrid clear: grid.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'HaMa 6/20/2024 11:15'
}
CAGridTest >> testFillTNT [
	| numCols numRows |
	numCols := grid numCols.
	numRows := grid numRows.
	CAGrid fillTNT: grid.
	1
		to: numRows
		do: [:rowIndex | 1
				to: numCols
				do: [:colIndex | self assert: CABlocks tnt equals: (grid getCellAtRow: rowIndex andCol: colIndex)]].
	CAGrid clear: grid.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'HaMa 6/20/2024 11:05'
}
CAGridTest >> testGetNeighbors [
	| numCols numRows neighbors|
	numCols := 3.
	numRows := 3.
	CAGrid clear: grid.
	neighbors := grid getNeighborsOfCellAtRow: 2 andCol: 2.
	1
		to: numRows
		do: [:rowIndex | 1
				to: numCols
				do: [:colIndex | self assert: CABlocks air equals: (neighbors at: rowIndex at: colIndex)]].
	grid putCell: 1 atRow: 2 andCol: 2.
	neighbors := grid getNeighborsOfCellAtRow: 2 andCol: 2.
	self assert: 1 equals: (neighbors at: 2 at: 2).
	CAGrid clear: grid.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'HaMa 6/20/2024 11:17'
}
CAGridTest >> testGrid [
	|gridMatrix|
	CAGrid clear: grid.
	grid putCell: 1 atRow: 1 andCol: 1.
	gridMatrix := grid grid.
	self assert: 1 equals: (gridMatrix at: 1 at: 1).
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'HaMa 6/20/2024 11:07'
}
CAGridTest >> testNumCols [
	self assert: 100 equals: grid numCols.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'HaMa 6/20/2024 11:07'
}
CAGridTest >> testNumRows [
	self assert: 100 equals: grid numRows.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'HaMa 6/20/2024 11:02'
}
CAGridTest >> testPutCellGetCell [
	grid putCell: 1 atRow: 1 andCol: 1.
	self assert: 1 equals: (grid getCellAtRow: 1 andCol: 1).
	CAGrid clear: grid.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'HaMa 6/20/2024 11:13'
}
CAGridTest >> testclear [
	| numCols numRows |
	numCols := grid numCols.
	numRows := grid numRows.
	CAGrid fillStone: grid.
	CAGrid clear: grid.
	1
		to: numRows
		do: [:rowIndex | 1
				to: numCols
				do: [:colIndex | self assert: CABlocks air equals: (grid getCellAtRow: rowIndex andCol: colIndex)]].
]

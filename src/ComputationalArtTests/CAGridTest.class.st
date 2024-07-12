Class {
	#name : #CAGridTest,
	#superclass : #TestCase,
	#instVars : [
		'grid'
	],
	#category : #ComputationalArtTests
}

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'KoPa 7/12/2024 20:00'
}
CAGridTest >> expectedFailures [

	^ {#testFillEmptyFail}.
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'KoPa 7/12/2024 19:44'
}
CAGridTest >> setUp [

	grid := CAGrid new.
]

{
	#category : #functional,
	#'squeak_changestamp' : 'KoPa 7/12/2024 19:45'
}
CAGridTest >> tearDown [

	grid := nil.
]

{
	#category : #testing,
	#'squeak_changestamp' : 'KoPa 7/12/2024 19:55'
}
CAGridTest >> testClear [

	| numCols numRows |
	numCols := grid numCols.
	numRows := grid numRows.
	CAGrid fillStone: grid.
	CAGrid clear: grid.
	1
		to: numRows
		do: [:rowIndex | 1
				to: numCols
				do: [:colIndex | 
					self assert: CABlocks air equals: (grid getCellAtRow: rowIndex andCol: colIndex).]].
]

{
	#category : #testing,
	#'squeak_changestamp' : 'KoPa 7/12/2024 19:55'
}
CAGridTest >> testDeepCopy [

	| numCols numRows copiedGrid |
	numCols := grid numCols.
	numRows := grid numRows.
	CAGrid fillStone: grid.
	copiedGrid := grid deepcopy.
	1 to: numRows
		do: [:rowIndex | 
			1 to: numCols
				do: [:colIndex | 
					self assert: 
					(copiedGrid getCellAtRow: rowIndex andCol: colIndex) 
					equals: 
					(grid getCellAtRow: rowIndex andCol: colIndex).]].
	copiedGrid putCell:-1 atRow: 1 andCol: 1.
	self assert: -1 < (grid getCellAtRow: 1 andCol: 1).
	CAGrid clear: grid.
]

{
	#category : #testing,
	#'squeak_changestamp' : 'KoPa 7/12/2024 19:55'
}
CAGridTest >> testFillEmptyFail [

	| numCols numRows |
	numCols := grid numCols.
	numRows := grid numRows.
	CAGrid fillStone: grid.
	1 to: numRows
		do: [:rowIndex | 
			1 to: numCols
				do: [:colIndex | 
					self assert: CABlocks air equals: (grid getCellAtRow: rowIndex andCol: colIndex).]].
	CAGrid clear: grid.
]

{
	#category : #testing,
	#'squeak_changestamp' : 'KoPa 7/12/2024 19:55'
}
CAGridTest >> testFillStone [

	| numCols numRows |
	numCols := grid numCols.
	numRows := grid numRows.
	CAGrid fillStone: grid.
	1 to: numRows
		do: [:rowIndex | 
			1 to: numCols
				do: [:colIndex | 
					self assert: CABlocks stone equals: (grid getCellAtRow: rowIndex andCol: colIndex).]].
	CAGrid clear: grid.
]

{
	#category : #testing,
	#'squeak_changestamp' : 'KoPa 7/12/2024 19:57'
}
CAGridTest >> testFillTNT [

	| numCols numRows |
	numCols := grid numCols.
	numRows := grid numRows.
	CAGrid fillTNT: grid.
	1 to: numRows
		do: [:rowIndex | 
			1 to: numCols
				do: [:colIndex | 
					self assert: CABlocks tnt equals: (grid getCellAtRow: rowIndex andCol: colIndex).]].
	CAGrid clear: grid.
]

{
	#category : #testing,
	#'squeak_changestamp' : 'KoPa 7/12/2024 19:57'
}
CAGridTest >> testGetNeighbors [

	| numCols numRows neighbors |
	numCols := 3.
	numRows := 3.
	CAGrid clear: grid.
	neighbors := grid getNeighborsOfCellAtRow: 2 andCol: 2.
	1 to: numRows
		do: [:rowIndex | 
			1 to: numCols
				do: [:colIndex | 
					self assert: CABlocks air equals: (neighbors at: rowIndex at: colIndex).]].
	grid putCell: 1 atRow: 2 andCol: 2.
	neighbors := grid getNeighborsOfCellAtRow: 2 andCol: 2.
	self assert: 1 equals: (neighbors at: 2 at: 2).
	CAGrid clear: grid.
]

{
	#category : #testing,
	#'squeak_changestamp' : 'KoPa 7/12/2024 19:48'
}
CAGridTest >> testGrid [

	| gridMatrix |
	CAGrid clear: grid.
	grid putCell: 1 atRow: 1 andCol: 1.
	gridMatrix := grid grid.
	self assert: 1 equals: (gridMatrix at: 1 at: 1).
]

{
	#category : #testing,
	#'squeak_changestamp' : 'KoPa 7/12/2024 19:48'
}
CAGridTest >> testNumCols [

	self assert: 100 equals: grid numCols.
]

{
	#category : #testing,
	#'squeak_changestamp' : 'KoPa 7/12/2024 19:48'
}
CAGridTest >> testNumRows [

	self assert: 100 equals: grid numRows.
]

{
	#category : #testing,
	#'squeak_changestamp' : 'KoPa 7/12/2024 19:48'
}
CAGridTest >> testPutCellGetCell [

	grid putCell: 1 atRow: 1 andCol: 1.
	self assert: 1 equals: (grid getCellAtRow: 1 andCol: 1).
	CAGrid clear: grid.
]

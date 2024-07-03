Class {
	#name : #CARuler,
	#superclass : #Object,
	#instVars : [
		'display'
	],
	#category : #ComputationalArt
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 7/3/2024 17:25'
}
CARuler >> applyRules: aRuleSet to: aGrid [ 
	| newGrid currGrid numRows numCols cellNeighbors newCellNeighbors newCellVal |
	numRows := aGrid numRows.
	numCols := aGrid numCols.
	currGrid := aGrid deepcopy.
	newGrid := aGrid.
	aRuleSet
		do: [:rule | 
			currGrid := newGrid deepcopy.
			1
				to: numRows
				do: [:rowIndex | 1
						to: numCols
						do: [:colIndex | 
							cellNeighbors := currGrid getNeighborsOfCellAtRow: rowIndex andCol: colIndex.
							newCellNeighbors := newGrid getNeighborsOfCellAtRow: rowIndex andCol: colIndex.
							newCellVal := rule applyRuleWith: cellNeighbors and: newCellNeighbors.
							newGrid
								putCell: newCellVal
								atRow: rowIndex
								andCol: colIndex]]].
	^ newGrid
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 6/16/2024 20:45'
}
CARuler >> printGrid: aGrid [
    
    | numRows numCols |
    
    numRows :=  aGrid numRows.
    numCols := aGrid numCols.

    1 to: numRows do: [:i |
        1 to: numCols do: [:j |
            Transcript show: (aGrid getCellAtRow: i andCol: j) printString; space.
        ].
        Transcript cr.
    ].
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 5/30/2024 12:11'
}
CARuler >> printMatrix: aMatrix [
    
    | numRows numCols |
    
    numRows :=  aMatrix rowCount.
    numCols := aMatrix columnCount.

    1 to: numRows do: [:i |
        1 to: numCols do: [:j |
            Transcript show: (aMatrix at: i at: j) printString; space.
        ].
        Transcript cr.
    ].
]

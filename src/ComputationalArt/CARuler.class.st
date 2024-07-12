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
	#'squeak_changestamp' : 'KoPa 7/12/2024 23:49'
}
CARuler >> applyRules: aRuleSet to: aGrid [ 
	| aGridCopy cellNeighbors newCellNeighbors newCellVal |
	
	aRuleSet do: [:rule | 
		aGridCopy := aGrid deepcopy.
		1 to: aGrid numRows do: [:rowIndex | 
			1 to: aGrid numCols do: [:colIndex | 
				cellNeighbors := aGridCopy neighborsOfCellAtRow: rowIndex andCol: colIndex.
				newCellNeighbors := aGrid neighborsOfCellAtRow: rowIndex andCol: colIndex.
				newCellVal := rule applyRuleWith: cellNeighbors and: newCellNeighbors.
				aGrid putCell: newCellVal atRow: rowIndex andCol: colIndex
			]
		]
	]
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'KoPa 7/12/2024 23:49'
}
CARuler >> printGrid: aGrid [
    
    | numRows numCols |
    
    numRows :=  aGrid numRows.
    numCols := aGrid numCols.

    1 to: numRows do: [:i |
        1 to: numCols do: [:j |
            Transcript show: (aGrid cellAtRow: i andCol: j) printString; space.
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

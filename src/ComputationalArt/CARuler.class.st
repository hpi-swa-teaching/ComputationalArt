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
	#'squeak_changestamp' : 'Sars 7/10/2024 14:41'
}
CARuler >> applyRules: aRuleSet to: aGrid [ 
	| aGridCopy cellNeighbors newCellNeighbors newCellVal |
	
	aRuleSet do: [:rule | 
		aGridCopy := aGrid deepcopy.
		1 to: aGrid numRows do: [:rowIndex | 
			1 to: aGrid numCols do: [:colIndex | 
				cellNeighbors := aGridCopy getNeighborsOfCellAtRow: rowIndex andCol: colIndex.
				newCellNeighbors := aGrid getNeighborsOfCellAtRow: rowIndex andCol: colIndex.
				newCellVal := rule applyRuleWith: cellNeighbors and: newCellNeighbors.
				aGrid putCell: newCellVal atRow: rowIndex andCol: colIndex
			]
		]
	]
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

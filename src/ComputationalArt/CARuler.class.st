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
	#'squeak_changestamp' : 'Sars 5/30/2024 13:50'
}
CARuler >> applyRules: aRuleSet to: aGrid [
    
    | newMatrix currMatrix numRows numCols cellNeighbors newCellVal|
	
    numRows := aGrid getRows.
    numCols := aGrid getCols.

    currMatrix := CAGrid new.
    currMatrix := aGrid.
    newMatrix :=CAGrid new.
    newMatrix := aGrid.

    aRuleSet do: [ :rule |
	  currMatrix := newMatrix.
	 
        1 to: numRows do: [ :rowIndex |
            1 to: numCols do: [ :colIndex |
	           cellNeighbors := currMatrix getNeighborsOfCellAtRow: rowIndex andCol: colIndex.
	           newCellVal := rule applyRuleWith: cellNeighbors.
                 newMatrix putCell: newCellVal atRow: rowIndex andCol: colIndex.
            ].
        ].  
    ].
    
    ^newMatrix.
	
    
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 5/30/2024 13:37'
}
CARuler >> printGrid: aGrid [
    
    | numRows numCols |
    
    numRows :=  aGrid getRows.
    numCols := aGrid getCols.

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

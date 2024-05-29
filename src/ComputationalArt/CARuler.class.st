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
	#'squeak_changestamp' : 'Sars 5/29/2024 16:53'
}
CARuler >> applyRuleWith: aMatrixOfNeighbors [

    | middleCellValue |

    middleCellValue := aMatrixOfNeighbors at: 2 at: 2.
    ^middleCellValue + 1.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 5/29/2024 23:49'
}
CARuler >> applyRules: aRuleSet to: aMatrix [
    
    | newMatrix currMatrix numRows numCols updatedValue cellNeighbors|
    
    numRows := aMatrix getCols.
    numCols := aMatrix getRows.

    currMatrix := aMatrix.
    newMatrix := aMatrix.

    aRuleSet do: [ :rule |
	  currMatrix := newMatrix.
	 
        1 to: numRows do: [ :rowIndex |
            1 to: numCols do: [ :colIndex |
	            cellNeighbors := currMatrix getNeighborsOfCellAtRow: colIndex andCol: rowIndex.
                  updatedValue := rule applyRuleWith: cellNeighbors.
                  newMatrix putCell: updatedValue atRow: rowIndex andCol:colIndex.
            ].
        ].  
    ].
    
    ^newMatrix.
	
    
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 5/29/2024 16:54'
}
CARuler >> printMatrix: aMatrix rows: numRows cols: numCols [
    "print the Grid given row and col count, because we also need them elsewhere"
    
    1 to: numRows do: [ :rowIndex |
        1 to: numCols do: [ :colIndex |
            Transcript show: ( aMatrix at: rowIndex  at: colIndex) printString; space.
        ].
        Transcript cr.
    ].
]

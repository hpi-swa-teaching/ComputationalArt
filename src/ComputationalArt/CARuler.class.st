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
	#'squeak_changestamp' : 'Sars 5/29/2024 15:56'
}
CARuler >> applyRuleWith: aMatrixOfNeighbors [

    | middleCellValue |

    middleCellValue := (aMatrixOfNeighbors at: 2) at: 2.
    ^middleCellValue + 1.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 5/29/2024 16:14'
}
CARuler >> applyRules: aRuleSet to: aMatrix [
    
    | newMatrix currMatrix numRows numCols updatedValue cellNeighbors|
    
    numRows := aMatrix getSizex.
    numCols := aMatrix getSizey.

    currMatrix := aMatrix.
    newMatrix := aMatrix.

    aRuleSet do: [ :rule |
	  currMatrix := newMatrix.
	 
        1 to: numRows do: [ :rowIndex |
            1 to: numCols do: [ :colIndex |
	            cellNeighbors := currMatrix getNeighborsOfCellAt: rowIndex and: colIndex.
                  updatedValue := rule applyRuleWith: cellNeighbors.
                  newMatrix putCell: updatedValue at: rowIndex and:colIndex.
            ].
        ].  
    ].
    
    ^newMatrix.
	
    
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 5/29/2024 15:40'
}
CARuler >> printMatrix: aMatrix rows: numRows cols: numCols [
    "print the Grid given row and col count, because we also need them elsewhere"
    
    1 to: numRows do: [ :rowIndex |
        1 to: numCols do: [ :colIndex |
            Transcript show: ( (aMatrix at: rowIndex ) at: colIndex) printString; space.
        ].
        Transcript cr.
    ].
]

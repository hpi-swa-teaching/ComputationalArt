Class {
	#name : #CAGrid,
	#superclass : #Object,
	#instVars : [
		'grid',
		'numCols',
		'numRows'
	],
	#category : #ComputationalArt
}

{
	#category : #functional,
	#'squeak_changestamp' : 'KoPa 7/12/2024 19:33'
}
CAGrid class >> clear: aGrid [

	| numCols numRows col |
	numCols := aGrid numCols.
	numRows := aGrid numRows.
	col := #(0 0).
	1 to: numRows
		do: [ :rowIndex | 1
				to: numCols
				do: [ :colIndex | aGrid
						putCell: col atRandom
						atRow: rowIndex
						andCol: colIndex. ]].
]

{
	#category : #functional,
	#'squeak_changestamp' : 'KoPa 7/12/2024 19:33'
}
CAGrid class >> fillStone: aGrid [

	| numCols numRows |
	numCols := aGrid numCols.
	numRows := aGrid numRows.
	1 to: numRows
		do: [ :rowIndex | 1
				to: numCols
				do: [ :colIndex | aGrid
						putCell: CABlocks stone
						atRow: rowIndex
						andCol: colIndex. ]].
]

{
	#category : #functional,
	#'squeak_changestamp' : 'KoPa 7/12/2024 19:33'
}
CAGrid class >> fillTNT: aGrid [

	| numCols numRows |
	numCols := aGrid numCols.
	numRows := aGrid numRows.
	1 to: numRows
		do: [ :rowIndex | 1
				to: numCols
				do: [ :colIndex | aGrid
						putCell: CABlocks tnt
						atRow: rowIndex
						andCol: colIndex. ]].
]

{
	#category : #constants,
	#'squeak_changestamp' : 'KoPa 7/12/2024 23:51'
}
CAGrid class >> size [
	"I return the num of rows and cols"
	
	^ 100.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'KoPa 7/12/2024 23:49'
}
CAGrid >> cellAtRow: aRow andCol: aCol [

	^ grid at: aRow at: aCol.
]

{
	#category : #copy,
	#'squeak_changestamp' : 'KoPa 7/12/2024 23:49'
}
CAGrid >> deepcopy [

	| clone |
	clone := CAGrid new.
	
      1 to: numRows do: [:rowIndex |
       	1 to: numCols do: [:colIndex |
            	clone putCell: (grid at: rowIndex at: colIndex) atRow: rowIndex andCol: colIndex.]].
	^ clone.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'KoPa 7/12/2024 23:49'
}
CAGrid >> grid [

	^ grid.
]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'KoPa 7/12/2024 23:51'
}
CAGrid >> initialize [

    numCols := CAGrid size.
    numRows := CAGrid size.
    
    grid := Matrix rows: numRows columns: numCols.
    
    1 to: numRows do: [:rowIndex |
        1 to: numCols do: [:colIndex |
            grid at: rowIndex at: colIndex put: 0.]].
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'KoPa 7/12/2024 23:49'
}
CAGrid >> neighborsOfCellAtRow: aRow andCol: aCol [

	| neighborMatrix temp gridRow gridCol |
	neighborMatrix := Matrix rows: 3 columns: 3.
	
	1 to: 3 do: [:row |
       	1 to: 3 do: [:col |
            	neighborMatrix at: row at: col put: 0.]].

	aCol=1 ifTrue: [
		neighborMatrix 
			at: 1 at: 1 put: -1;
			at: 2 at: 1 put: -1;
			at: 3 at: 1 put: -1.].

	aRow=1 ifTrue: [
		neighborMatrix 
			at: 1 at: 1 put: -1;
			at: 1 at: 2 put: -1;
			at: 1 at: 3 put: -1.].

	aRow=numRows ifTrue: [
		neighborMatrix 
			at: 3 at: 1 put: -1;
			at: 3 at: 2 put: -1;
		 	at: 3 at: 3 put: -1.].

	aCol=numCols ifTrue: [
		neighborMatrix 
			at: 1 at: 3 put: -1;
			at: 2 at: 3 put: -1;
			at: 3 at: 3 put: -1.].
	
	1 to: 3 do: [:rowOffset |
    		1 to: 3 do: [:colOffset |
			temp := neighborMatrix at: rowOffset at: colOffset.
       		(temp = 0) ifTrue: [
				gridRow := aRow+rowOffset-2.
				gridCol := aCol+colOffset-2.
				temp := grid at: gridRow at: gridCol.
				neighborMatrix at: rowOffset at: colOffset put: temp.]]].
 
	^ neighborMatrix.
		
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'KoPa 7/12/2024 23:51'
}
CAGrid >> numCols [

	^ numCols.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'KoPa 7/12/2024 23:51'
}
CAGrid >> numRows [

	^ numRows.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'KoPa 7/12/2024 23:52'
}
CAGrid >> putCell: aCell atRow: aRow andCol: aCol [

	grid at: aRow at: aCol put: aCell.
]

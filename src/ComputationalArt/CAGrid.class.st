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
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'HaMa 6/20/2024 10:48'
}
CAGrid class >> clear: aGrid [ 
	| numCols numRows col |
	numCols := aGrid numCols.
	numRows := aGrid numRows.
	col := #(0 0).
	1
		to: numRows
		do: [:rowIndex | 1
				to: numCols
				do: [:colIndex | aGrid
						putCell: col atRandom
						atRow: rowIndex
						andCol: colIndex]]
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 6/16/2024 20:45'
}
CAGrid class >> fill: aGrid [ 
	| rand numCols numRows |
	numCols := aGrid numCols.
	numRows := aGrid numRows.
	rand := #(1 1 1 1 1 1 1 1 1 1 1 1 1 1 1 2 2 3 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 4 7 7 6 6 6 5 5 5 5 5 9 8 8).
	1
		to: numRows
		do: [:rowIndex | 1
				to: numCols
				do: [:colIndex | rowIndex < 45
						ifTrue: [aGrid
								putCell: rand atRandom
								atRow: rowIndex
								andCol: colIndex]
						ifFalse: [aGrid
								putCell: 0
								atRow: rowIndex
								andCol: colIndex]]]
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'HaMa 6/20/2024 11:14'
}
CAGrid class >> fillStone: aGrid [ 
	| numCols numRows |
	numCols := aGrid numCols.
	numRows := aGrid numRows.
	1
		to: numRows
		do: [:rowIndex | 1
				to: numCols
				do: [:colIndex | aGrid
						putCell: CABlocks stone
						atRow: rowIndex
						andCol: colIndex]]
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'HaMa 6/20/2024 11:14'
}
CAGrid class >> fillTNT: aGrid [ 
	| numCols numRows |
	numCols := aGrid numCols.
	numRows := aGrid numRows.
	1
		to: numRows
		do: [:rowIndex | 1
				to: numCols
				do: [:colIndex | aGrid
						putCell: CABlocks tnt
						atRow: rowIndex
						andCol: colIndex]]
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'HaMa 5/31/2024 13:38'
}
CAGrid >> deepcopy [
	|clone|
	clone := CAGrid new.
	
      1 to: numRows do: [:rowIndex |
       	1 to: numCols do: [: colIndex|
            	"grid at: rowIndex at: colIndex put: 10 * rowIndex + colIndex."
			clone putCell: (grid at: rowIndex at: colIndex) atRow: rowIndex andCol: colIndex.
        	].
    	].
	^ clone
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 5/29/2024 23:51'
}
CAGrid >> getCellAtRow: row andCol: col [

	^grid at: row at: col
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 5/30/2024 13:43'
}
CAGrid >> getNeighborsOfCellAtRow: row andCol: col [
	"get the 3x3 of cells surrounding a certain input"
	|neighborMatrix temp gridRow gridCol|
	neighborMatrix := Matrix rows: 3 columns: 3.
	
	1 to: 3 do: [:i |
       	1 to: 3 do: [:j |
            	neighborMatrix at: i at: j put: 0.
        	].
    	].

	(col=1) ifTrue: [
		neighborMatrix 
			at: 1 at: 1 put: -1;
			at: 2 at: 1 put: -1;
			at: 3 at: 1 put: -1.
	].

	(row=1) ifTrue: [
		neighborMatrix 
			at: 1 at: 1 put: -1;
			at: 1 at: 2 put: -1;
			at: 1 at: 3 put: -1.
	].

	(row=numRows) ifTrue: [
		neighborMatrix 
			at: 3 at: 1 put: -1;
			at: 3 at: 2 put: -1;
		 	at: 3 at: 3 put: -1.
	].

	(col=numCols) ifTrue: [
		neighborMatrix 
			at: 1 at: 3 put: -1;
			at: 2 at: 3 put: -1;
			at: 3 at: 3 put: -1.
	].
	
	1 to: 3 do: [:rowOffset |
    		1 to: 3 do: [:colOffset |
			temp := neighborMatrix at: rowOffset at: colOffset.
       		(temp == 0) ifTrue: [
				gridRow := row+rowOffset-2.
				gridCol := col+colOffset-2.
				temp := grid at: gridRow at: gridCol.
				neighborMatrix at: rowOffset at: colOffset put: temp.
			].
    		].
	].
 
	^neighborMatrix
		
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 6/16/2024 20:45'
}
CAGrid >> grid [

	^grid
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 6/7/2024 15:51'
}
CAGrid >> initialize [

    numCols := 100.
    numRows := 100.
    
    grid := Matrix rows: numRows columns: numCols.
    
    1 to: numRows do: [:rowIndex |
        1 to: numCols do: [:colIndex |
            grid at: rowIndex at: colIndex put: 0.
           
        ].
    ].
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 6/16/2024 20:44'
}
CAGrid >> numCols [

	^numCols
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 6/16/2024 20:45'
}
CAGrid >> numRows [

	^numRows
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 5/30/2024 12:04'
}
CAGrid >> putCell: cell atRow: row andCol: col [

	grid at: row at: col put: cell.
]

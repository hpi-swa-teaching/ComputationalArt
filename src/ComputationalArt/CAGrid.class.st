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
	#'squeak_changestamp' : 'Sars 5/29/2024 23:51'
}
CAGrid >> getCellAtRow: row andCol: col [

	^grid at: row at: col
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 5/29/2024 23:50'
}
CAGrid >> getCols [

	^numCols
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 5/30/2024 00:39'
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
		neighborMatrix at: 1 at: 1 put: -1.
		neighborMatrix at: 2 at: 1 put: -1.
		neighborMatrix at: 3 at: 1 put: -1.
	].

	(row=1) ifTrue: [
		neighborMatrix at: 1 at: 1 put: -1.
		neighborMatrix at: 1 at: 2 put: -1.
		neighborMatrix at: 1 at: 3 put: -1.
	].

	(row=numRows) ifTrue: [
		neighborMatrix at: 1 at: 3 put: -1.
		neighborMatrix at: 2 at: 3 put: -1.
		neighborMatrix at: 3 at: 3 put: -1.
	].

	(col=numCols) ifTrue: [
		neighborMatrix at: 3 at: 1 put: -1.
		neighborMatrix at: 3 at: 2 put: -1.
		neighborMatrix at: 3 at: 3 put: -1.
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
	#'squeak_changestamp' : 'Sars 5/29/2024 23:50'
}
CAGrid >> getRows [

	^numRows
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 5/29/2024 23:45'
}
CAGrid >> initialize [
	"comment stating purpose of message"
	|x y|
	numCols := 10.
	numRows := 10.
	grid := Matrix rows: numRows columns: numCols.
	x := 1.
	y := 1.
	[y<(numRows+1)] whileTrue: [
		[x<(numCols+1)] whileTrue: [
			grid at: y at: x put: x+(y*numRows).
			x := x +1.
		].
		x := 1.
		y := y +1.
	].
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 5/29/2024 23:31'
}
CAGrid >> putCell: cell atRow: y andCol: x [
	"comment stating purpose of message"
	grid at: y at: x put: cell.
]

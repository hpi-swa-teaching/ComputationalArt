Class {
	#name : #Grid,
	#superclass : #Object,
	#instVars : [
		'grid',
		'sizex',
		'sizey'
	],
	#category : #ComputationalArt
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'HaMa 5/29/2024 13:46'
}
Grid >> getCellAt: x and: y [
	"comment stating purpose of message"

	^grid at: x at: y
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'HaMa 5/29/2024 15:13'
}
Grid >> getNeighborsOfCellAt: x and: y [
	"comment stating purpose of message"
	|neighborMatrix temp|
	neighborMatrix := Matrix rows: 3 columns: 3.
	temp := -1.
	((x>0) and: (y>0))
		ifTrue: [temp := grid at: (x-1) at: (y-1)].
	neighborMatrix at: 1 at: 1 put: temp.
	temp := -1.
	(x>0)
		ifTrue: [temp := grid at: (x-1) at: y].
	neighborMatrix at: 1 at: 2 put: temp.
	temp := -1.
	((x>0) and: (y<(sizey+1)))
		ifTrue: [temp := grid at: (x-1) at: (y +1)].
	neighborMatrix at: 1 at: 3 put: temp.
	temp := -1.
	(y>0)
		ifTrue: [temp := grid at: x at: (y-1)].
	neighborMatrix at: 2 at: 1 put: temp.
	temp := grid at: x at: y.
	neighborMatrix at: 2 at: 2 put: temp.
	temp := -1.
	(y<(sizey+1))
		ifTrue: [temp := grid at: x at: (y +1)].
	neighborMatrix at: 2 at: 3 put: temp.
	temp := -1.
	((x<(sizex+1)) and: (y>0))
		ifTrue: [temp := grid at: (x+1) at: (y -1)].
	neighborMatrix at: 3 at: 1 put: temp.
	temp := -1.
	(x<(sizex+1))
		ifTrue: [temp := grid at: (x+1) at: y].
	neighborMatrix at: 3 at: 2 put: temp.
	temp := -1.
	((x<(sizex+1)) and: (y<(sizey+1)))
		ifTrue: [temp := grid at: (x+1) at: (y+1)].
	neighborMatrix at: 3 at: 3 put: temp.
	^neighborMatrix
		
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'HaMa 5/29/2024 15:15'
}
Grid >> initialize [
	"comment stating purpose of message"
	|x y|
	sizex := 10.
	sizey := 10.
	grid := Matrix rows: sizex columns: sizey.
	x := 1.
	y := 1.
	[x<(sizex+1)] whileTrue: [
		[y<(sizey+1)] whileTrue: [
			grid at: x at: y put: -1.
			y := y +1.
		].
		x := x +1.
	].
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'HaMa 5/29/2024 14:14'
}
Grid >> putCell: cell at: x and: y [
	"comment stating purpose of message"
	grid at: x at: y put: cell.
]

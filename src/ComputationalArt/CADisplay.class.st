Class {
	#name : #CADisplay,
	#superclass : #Object,
	#instVars : [
		'viewMorph',
		'cells',
		'attachedGrid',
		'attachedGame'
	],
	#category : #ComputationalArt
}

{
	#category : #constants,
	#'squeak_changestamp' : 'KoPa 7/12/2024 18:27'
}
CADisplay class >> border [

	^ 1.
]

{
	#category : #constants,
	#'squeak_changestamp' : 'KoPa 7/12/2024 19:04'
}
CADisplay class >> borderWidth [
	"I return the borderWidth of a viewMorph"
	
	^ 5.
]

{
	#category : #constants,
	#'squeak_changestamp' : 'KoPa 7/12/2024 19:01'
}
CADisplay class >> bounds [
	"I return the bounds of a viewMorph"

	^ 100 @ 100 corner: 1450 @ 1160.
]

{
	#category : #constants,
	#'squeak_changestamp' : 'KoPa 7/12/2024 19:02'
}
CADisplay class >> color [
	"I return the color of a viewMorph"
	
	^ Color r:  176/255 g: 196/255 b: 222/255.
]

{
	#category : #constants,
	#'squeak_changestamp' : 'KoPa 7/12/2024 18:26'
}
CADisplay class >> gap [
	
	^ 0.
]

{
	#category : #constants,
	#'squeak_changestamp' : 'KoPa 7/12/2024 18:27'
}
CADisplay class >> offset [

	^ 320@30.
]

{
	#category : #constants,
	#'squeak_changestamp' : 'KoPa 7/12/2024 18:27'
}
CADisplay class >> size [

	^ 10.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'KoPa 7/12/2024 18:38'
}
CADisplay >> attachedGame: aGame [

	attachedGame := aGame.

]

{
	#category : #accessing,
	#'squeak_changestamp' : 'KoPa 7/12/2024 18:38'
}
CADisplay >> attachedGrid: aGrid [

	attachedGrid := aGrid.

]

{
	#category : #'initialize-release',
	#'squeak_changestamp' : 'KoPa 7/12/2024 19:03'
}
CADisplay >> initialize [

	cells := OrderedCollection new.
	viewMorph := Morph new
				bounds: CADisplay bounds; 
				color: CADisplay color; 
				borderColor: Color gray;
				borderWidth: CADisplay borderWidth;
				openInWorldOrWorldlet; 
				yourself.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'KoPa 7/12/2024 18:58'
}
CADisplay >> showGrid: aGrid [

	| grid cols rows origin size border gap blockLookup cellMorph cell |
	blockLookup := CABlocks new.
	grid := aGrid grid.	
	cols := aGrid numCols.
	rows := aGrid numRows.
	origin := viewMorph position.
	size := CADisplay size.
	border := CADisplay border.
	gap := CADisplay gap.

	self wipeCells.

	1 to: rows do: [ :rowIndex |
    		1 to:  cols do: [ :colIndex |
        		cell := aGrid getCellAtRow: rowIndex andCol: colIndex.
        		cellMorph := Morph new
            	extent: size @ size;
            	borderColor: Color black;
            	color: (blockLookup colorAt: cell);
            	borderWidth: border;
            	position: (((colIndex-1) * (size+gap)) @ ((rowIndex-1) * (size+gap)) + origin).
        		viewMorph addMorph: cellMorph.
        		cells add: cellMorph. ]].
]

{
	#category : #functional,
	#'squeak_changestamp' : 'KoPa 7/12/2024 18:58'
}
CADisplay >> step [
	
	| grid cols rows origin size border gap blockLookup aGrid cell cellMorph |
	aGrid := attachedGrid.
	blockLookup := CABlocks new.
	grid := aGrid grid.
	cols := aGrid numCols.
	rows := aGrid numRows.
	origin := viewMorph position + CADisplay offset.
	size := CADisplay size.
	border := CADisplay border.
	gap := CADisplay gap.
	
	cells isEmpty
		ifTrue: [
			(1 to: rows)
				do: [ :rowIndex | (1 to: cols)
						do: [ :colIndex |
							cell := aGrid getCellAtRow: rowIndex andCol: colIndex.
							cellMorph := CACellMorph new extent: size @ size;
										 borderColor: Color gray;
										
										color: (blockLookup colorAt: cell);
										 borderWidth: border;
										 position: colIndex - 1 * (size + gap) @ (rowIndex - 1 * (size + gap)) + origin;
										row: rowIndex;
										col: colIndex;
										game: attachedGame.
							viewMorph addMorph: cellMorph.
							cells add: cellMorph. ]]].
	cells isEmpty
		ifFalse: [
			(1 to: rows)
				do: [ :rowIndex | (1 to: cols)
						do: [ :colIndex | 
							cell := aGrid getCellAtRow: rowIndex andCol: colIndex.
							cellMorph := cells at: rowIndex - 1 * rows + colIndex.
							cellMorph
								color: (blockLookup colorAt: cell). ]]].
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'KoPa 7/12/2024 18:07'
}
CADisplay >> viewMorph [
	
	^ viewMorph.
]

{
	#category : #functional,
	#'squeak_changestamp' : 'KoPa 7/12/2024 18:11'
}
CADisplay >> wipeCells [

	cells do: [ :eachMorph |
		eachMorph delete. ].
	cells removeAll.

]

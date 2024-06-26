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
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 6/16/2024 20:43'
}
CADisplay >> attachedGame: aGame [

	attachedGame := aGame.

]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 6/16/2024 20:43'
}
CADisplay >> attachedGrid: aGrid [

	attachedGrid := aGrid.

]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 6/23/2024 15:54'
}
CADisplay >> initialize [
	cells := OrderedCollection new.
	viewMorph := Morph new
				bounds: (100 @ 100 corner: 1450 @ 1160); 
				color: (Color r:  176/255 g: 196/255 b: 222/255); 
				borderColor: Color gray;
				borderWidth: 5;
				openInWorldOrWorldlet; 
				yourself.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 6/16/2024 20:45'
}
CADisplay >> showGrid: aGrid [

|grid cols rows origin size border gap blockLookup|

blockLookup := CABlocks new.
grid := aGrid grid.	
cols := aGrid numCols.
rows := aGrid numRows.
origin := viewMorph position.
size := 10.
border := 1.
gap := 0.

self wipeCells.

(1 to: rows) do: [:rowIndex |
    (1 to:  cols) do: [:colIndex |
        | cellMorph cell|
        cell := aGrid getCellAtRow: rowIndex andCol: colIndex.
        cellMorph := Morph new
            extent: size @ size;
            borderColor: Color black;
            color: "Color random;" (blockLookup colorOf: cell);
            borderWidth: border;
            position: (((colIndex-1) * (size+gap)) @ ((rowIndex-1) * (size+gap)) + origin).
        viewMorph addMorph: cellMorph.
        cells add: cellMorph.
    ].
].
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 6/23/2024 15:39'
}
CADisplay >> step [
	| grid cols rows origin size border gap blockLookup aGrid |
	aGrid := attachedGrid.
	blockLookup := CABlocks new.
	grid := aGrid grid.
	cols := aGrid numCols.
	rows := aGrid numRows.
	origin := viewMorph position + (320@30).
	size := 10.
	border := 1.
	gap := 0.
	cells isEmpty
		ifTrue: [Transcript show: 'grid was empty';
				 cr.
			(1 to: rows)
				do: [:rowIndex | (1 to: cols)
						do: [:colIndex | 
							| cellMorph cell |
							cell := aGrid getCellAtRow: rowIndex andCol: colIndex.
							cellMorph := CACellMorph new extent: size @ size;
										 borderColor: Color gray;
										
										color: (blockLookup colorOf: cell);
										 borderWidth: border;
										 position: colIndex - 1 * (size + gap) @ (rowIndex - 1 * (size + gap)) + origin;
										row: rowIndex;
										col: colIndex;
										game: attachedGame.
							viewMorph addMorph: cellMorph.
							cells add: cellMorph]]].
	cells isEmpty
		ifFalse: [Transcript show: 'grid was not empty';
				 cr.
			(1 to: rows)
				do: [:rowIndex | (1 to: cols)
						do: [:colIndex | 
							| cellMorph cell |
							cell := aGrid getCellAtRow: rowIndex andCol: colIndex.
							cellMorph := cells at: rowIndex - 1 * rows + colIndex.
							cellMorph
								color: (blockLookup colorOf: cell)]]]
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 6/16/2024 20:43'
}
CADisplay >> viewMorph [
	
	^viewMorph
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 6/3/2024 23:45'
}
CADisplay >> wipeCells [

cells do: [:eachMorph |
    eachMorph delete.
].
cells removeAll.

]

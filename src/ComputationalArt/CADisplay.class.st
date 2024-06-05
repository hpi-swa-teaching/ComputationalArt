Class {
	#name : #CADisplay,
	#superclass : #Object,
	#instVars : [
		'viewMorph',
		'cells',
		'attachedGrid'
	],
	#category : #ComputationalArt
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Pepe Simon 5/28/2024 15:19'
}
CADisplay class >> open [
	^ CADisplay new.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 6/4/2024 14:05'
}
CADisplay >> attachGrid: aGrid [

	attachedGrid := aGrid.

]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 6/3/2024 23:44'
}
CADisplay >> getViewMorph [
	
	^viewMorph
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 6/4/2024 13:34'
}
CADisplay >> initialize [
	cells := OrderedCollection new.
	viewMorph := Morph new.
	viewMorph bounds: (100@100 corner: 1100@1100).
	viewMorph color: Color white.
	viewMorph openInWorldOrWorldlet.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 6/4/2024 13:35'
}
CADisplay >> showGrid: aGrid [

|grid cols rows origin size border gap blockLookup|

blockLookup := CABlocks new.
grid := aGrid getGrid.	
cols := aGrid getCols.
rows := aGrid getRows.
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
	#'squeak_changestamp' : 'Sars 6/5/2024 15:20'
}
CADisplay >> step [
	| grid cols rows origin size border gap blockLookup aGrid |
	aGrid := attachedGrid.
	blockLookup := CABlocks new.
	grid := aGrid getGrid.
	cols := aGrid getCols.
	rows := aGrid getRows.
	origin := viewMorph position.
	size := 10.
	border := 1.
	gap := 0.
	cells isEmpty
		ifTrue: [Transcript show: 'grid was empty'; cr.
			(1 to: rows)
				do: [:rowIndex | (1 to: cols)
						do: [:colIndex | 
							| cell cellMorph |
							cell := aGrid getCellAtRow: rowIndex andCol: colIndex.
							cellMorph := Morph new extent: size @ size;
										 borderColor: Color black;
										 color: ( blockLookup colorOf: cell);
										 borderWidth: border;
										 position: colIndex - 1 * (size + gap) @ (rowIndex - 1 * (size + gap)) + origin.
							viewMorph addMorph: cellMorph.
							cells add: cellMorph]]].
	cells isEmpty
		ifFalse: [Transcript show: 'grid was not empty'; cr.
			(1 to: rows)
				do: [:rowIndex | (1 to: cols)
						do: [:colIndex | 
							| cellMorph cell|
							cell := aGrid getCellAtRow: rowIndex andCol: colIndex.
							cellMorph := cells at: rowIndex - 1 * rows + colIndex.
							cellMorph color: ( blockLookup colorOf: cell)]]]
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

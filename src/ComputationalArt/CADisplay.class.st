Class {
	#name : #CADisplay,
	#superclass : #Object,
	#instVars : [
		'viewMorph',
		'cells'
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
	#'squeak_changestamp' : 'Sars 6/3/2024 23:44'
}
CADisplay >> getViewMorph [
	
	^viewMorph
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 6/3/2024 23:45'
}
CADisplay >> initialize [
	cells := OrderedCollection new.
	viewMorph := Morph new.
	viewMorph bounds: (100@100 corner: 700@700).
	viewMorph color: Color white.
	viewMorph openInWorldOrWorldlet.
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 6/3/2024 23:45'
}
CADisplay >> showGrid: aGrid [

|grid cols rows origin size border gap blockLookup|

blockLookup := CABlocks new.
grid := aGrid getGrid.	
cols := aGrid getCols.
rows := aGrid getRows.
origin := viewMorph position.
size := 5.
border := 2.
gap := 2.

self wipeCells.

(1 to: rows) do: [:rowIndex |
    (1 to:  cols) do: [:colIndex |
        | cellMorph cell|
        cell := aGrid getCellAtRow: rowIndex andCol: colIndex.
        cellMorph := Morph new
            extent: size @ size;
            borderColor: Color black;
            color: Color random; "(blockLookup colorOf: cell);"
            borderWidth: border;
            position: ((colIndex * (size+gap)) @ (rowIndex * (size+gap)) + origin).
        viewMorph addMorph: cellMorph.
        cells add: cellMorph.
    ].
].
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

Class {
	#name : #CACellMorph,
	#superclass : #Morph,
	#instVars : [
		'game',
		'row',
		'col'
	],
	#category : #ComputationalArt
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 6/16/2024 14:58'
}
CACellMorph >> col: colPos [ 
	col:= colPos
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 6/16/2024 14:58'
}
CACellMorph >> game: aGame [ 
	game := aGame
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 6/16/2024 15:02'
}
CACellMorph >> handlesMouseDown: anEvent [
^ true
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 6/16/2024 15:19'
}
CACellMorph >> mouseDown: anEvent [ 
	anEvent redButtonPressed
		ifTrue: [game putCellAtRow: row andCol: col]
]

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Sars 6/16/2024 14:58'
}
CACellMorph >> row: rowPos [
row := rowPos
]

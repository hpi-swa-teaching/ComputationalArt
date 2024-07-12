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
	#category : #accessing,
	#'squeak_changestamp' : 'KoPa 7/12/2024 18:39'
}
CACellMorph >> col: aPosition [ 

	col:= aPosition.
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'KoPa 7/12/2024 18:38'
}
CACellMorph >> game: aGame [ 

	game := aGame.
]

{
	#category : #handling,
	#'squeak_changestamp' : 'KoPa 7/12/2024 18:38'
}
CACellMorph >> handlesMouseDown: anEvent [

	^ true.
]

{
	#category : #handling,
	#'squeak_changestamp' : 'KoPa 7/12/2024 18:38'
}
CACellMorph >> handlesMouseOver: anEvent [

	^ true.
]

{
	#category : #handling,
	#'squeak_changestamp' : 'KoPa 7/12/2024 18:38'
}
CACellMorph >> mouseDown: anEvent [

	anEvent redButtonPressed
		ifTrue: [game putCellAtRow: row andCol: col]
		ifFalse: [game toggleBrushActive].
]

{
	#category : #handling,
	#'squeak_changestamp' : 'KoPa 7/12/2024 18:39'
}
CACellMorph >> mouseEnter: anEvent [

	game brushActive
		ifTrue: [game putCellAtRow: row andCol: col].
		
]

{
	#category : #accessing,
	#'squeak_changestamp' : 'KoPa 7/12/2024 18:39'
}
CACellMorph >> row: aPosition [

	row := aPosition.
]

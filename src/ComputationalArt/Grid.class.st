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
	#'squeak_changestamp' : 'HaMa 5/29/2024 13:40'
}
Grid >> initialize [
	"comment stating purpose of message"
	grid := Matrix rows: sizex columns: sizey
]

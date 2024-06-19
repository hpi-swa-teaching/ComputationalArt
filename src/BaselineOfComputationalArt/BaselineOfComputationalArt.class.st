Class {
	#name : #BaselineOfComputationalArt,
	#superclass : #BaselineOf,
	#category : #BaselineOfComputationalArt
}

{
	#category : #'as yet unclassified',
	#'squeak_changestamp' : 'Pepe Simon 6/19/2024 15:20'
}
BaselineOfComputationalArt >> baseline: spec [
    <baseline>
    spec
        for: #'common'
        do: [
            spec
                package: 'ComputationalArt';
                package: 'ComputationalArtTests' with: [spec requires: #('default')];
                yourself.
            spec
                group: 'default' with: #('ComputationalArt');
                group: 'tests' with: #('ComputationalArtTests');
                yourself].
]

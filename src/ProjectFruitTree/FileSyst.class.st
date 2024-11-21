Class {
	#name : 'FileSyst',
	#superclass : 'Object',
	#category : 'ProjectFruitTree',
	#package : 'ProjectFruitTree'
}

{ #category : 'loading' }
FileSyst class >> loadFromCodeFile: pathString [
pathString asFileReference readStreamDo: [ :in | ^ Smalltalk compiler evaluate: in contents ]
]

{ #category : 'loading' }
FileSyst class >> loadFromStonFile: pathString [
pathString asFileReference readStreamDo: [ :in | ^ (STON reader on: in) next ]
]

{ #category : 'as yet unclassified' }
FileSyst class >> piclFileAndLoad: pattern [

	|pathString|
	pathString := UIManager default
			chooseFullFileNameMatching: { pattern }
			label: 'Choose file to open'.
	pathString ifNil: [ ^ nil ].
	'*.ston' = pattern ifTrue: [ ^self loadFromStonFile: pathString ].
	'*.stc' = pattern ifTrue: [ ^self loadFromCodeFile: pathString ].
	^ self error: 'Unknown type of file: ', pattern 
]

{ #category : 'printing' }
FileSyst class >> printToFile: pathString [
	pathString asFileReference writeStreamDo: [ :out | 
		out nextPutAll: self printString ]
]

{ #category : 'files' }
FileSyst class >> saveToFile: pathString [

	pathString asFileReference writeStreamDo:  [ :out |
		out nextPutAll: (STON toString: self) ]
	
]

{ #category : 'saving' }
FileSyst class >> storeToFile: pathString [

	pathString asFileReference writeStreamDo: [ :out |
		out nextPutAll: self storeString ]
]

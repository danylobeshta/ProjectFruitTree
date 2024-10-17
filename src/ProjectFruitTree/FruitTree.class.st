Class {
	#name : 'FruitTree',
	#superclass : 'Object',
	#instVars : [
		'species',
		'age',
		'height',
		'yield',
		'fruitingAge',
		'frostOccured'
	],
	#category : 'ProjectFruitTree',
	#package : 'ProjectFruitTree'
}

{ #category : 'instance creation' }
FruitTree class >> newWithDefaults [ [
    ^self new initialize
]
]

{ #category : 'comparing' }
FruitTree >> = anObject [ [
    ^anObject isKindOf: FruitTree ifTrue: [self species = anObject species and: [self age = anObject age]]
]
]

{ #category : 'converting' }
FruitTree >> asString [ 
    | result |
    
    result := String streamContents: [:stream |
        stream
            nextPutAll: 'Species: ', species; cr;
            nextPutAll: '   Age: ', age printString; cr;
            nextPutAll: '   Height: ', height printString; cr;
            nextPutAll: '   Yield: ', yield printString; cr;
            nextPutAll: '   Fruiting Age: ', fruitingAge printString; cr;
            nextPutAll: '   Frost Occurred: ', frostOccured printString; cr.
    ].

    ^ result

]

{ #category : 'as yet unclassified' }
FruitTree >> getAge [
	^age.
	
]

{ #category : 'as yet unclassified' }
FruitTree >> getFruitingAge [
	^fruitingAge 
]

{ #category : 'as yet unclassified' }
FruitTree >> getHeight [
	^height
]

{ #category : 'as yet unclassified' }
FruitTree >> getSpecies [
	^species 
]

{ #category : 'as yet unclassified' }
FruitTree >> getYield [ 
    ^yield.

]

{ #category : 'as yet unclassified' }
FruitTree >> growOneYear: frostStatus [ 
    age := age + 1.
    height := height + 0.5. "Height increase"
    frostOccured := frostStatus.
    (age >= fruitingAge) ifTrue: [
        self increaseYield. "Increasing of yield after start of fruiting"
    ].

]

{ #category : 'as yet unclassified' }
FruitTree >> increaseYield [ 
    yield := yield + 10.

]

{ #category : 'initialization' }
FruitTree >> initialize [ 
    species := 'Fig'.
    age := 0.
    height := 1.0.
    yield := 0.
    fruitingAge := 1. 
	 frostOccured := false.

]

{ #category : 'initialization' }
FruitTree >> initializeTree: aSpecies age: anAge height: aHeight yield: aYield fruitingAge: aFruitingAge frostOccured: afrostOccured [ 
    species := aSpecies.
    age := anAge.
    height := aHeight.
    yield := aYield.
    fruitingAge := aFruitingAge.
	 frostOccured := afrostOccured.

]

{ #category : 'printing' }
FruitTree >> printTree: aTranscript [ 
	
    aTranscript
        show: 'Species: ', species; cr;
        show: '   Age: ', age printString; cr;
        show: '   Height: ', height printString; cr;
        show: '   Yield: ', yield printString; cr;
        show: '   Fruiting Age: ', fruitingAge printString; cr;
        show: '   Frost Occurred: ', frostOccured printString; cr;
        cr.  "New line"

]

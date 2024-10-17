Class {
	#name : 'ApricotTree',
	#superclass : 'FruitTree',
	#category : 'ProjectFruitTree',
	#package : 'ProjectFruitTree'
}

{ #category : 'instance creation' }
ApricotTree class >> newWithDefaults [ [
    ^self new initialize
]
]

{ #category : 'converting' }
ApricotTree >> asString [ 
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
ApricotTree >> decreaseYield [ 
    yield := yield* 1.2. "yield decreased to 20% when tree was frozen"

]

{ #category : 'as yet unclassified' }
ApricotTree >> growOneYear: frostStatus [

	age := age + 1.
	height := height + 0.5.
	frostOccured := frostStatus.

	age >= fruitingAge ifFalse: [ ^ self ].
	frostOccured ifTrue: [ self decreaseYield ].
	frostOccured ifFalse: [ self increaseYield ]
]

{ #category : 'initialization' }
ApricotTree >> initialize [ 
    species := 'Apricot Tree'.
    age := 0.
    height := 1.0.
    yield := 10.
    fruitingAge := 3. 
    frostOccured := true. 

]

{ #category : 'initialization' }
ApricotTree >> initializeTree: aSpecies age: anAge height: aHeight yield: aYield fruitingAge: aFruitingAge frostOccured: afrostOccured [ 
    super initializeTree: aSpecies age: anAge height: aHeight yield: aYield fruitingAge: aFruitingAge frostOccured: afrostOccured .
   

]

{ #category : 'printing' }
ApricotTree >> printTree: aTranscript [ 
     aTranscript
        show: 'Species: ', species; cr;
        show: '   Age: ', age printString; cr;
        show: '   Height: ', height printString; cr;
        show: '   Yield: ', yield printString; cr;
        show: '   Fruiting Age: ', fruitingAge printString; cr;
        show: '   Frost Occurred: ', frostOccured printString; cr;
		  cr.  "New line"
        

]

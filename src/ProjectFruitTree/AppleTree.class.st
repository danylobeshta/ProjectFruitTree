Class {
	#name : 'AppleTree',
	#superclass : 'FruitTree',
	#instVars : [
		'isFruitYear',
		'fruitColor'
	],
	#category : 'ProjectFruitTree',
	#package : 'ProjectFruitTree'
}

{ #category : 'instance creation' }
AppleTree class >> newWithDefaults [ [
    ^self new initialize
]
]

{ #category : 'converting' }
AppleTree >> asString [ 
    | result |
    
    result := String streamContents: [:stream |
        stream
            nextPutAll: 'Species: ', species; cr;
            nextPutAll: '   Age: ', age printString; cr;
            nextPutAll: '   Height: ', height printString; cr;
            nextPutAll: '   Yield: ', yield printString; cr;
            nextPutAll: '   Fruiting Age: ', fruitingAge printString; cr;
            nextPutAll: '   Frost Occurred: ', frostOccured printString; cr;
				nextPutAll: '   Fruit Color: ', fruitColor; cr.
    ].

    ^ result

]

{ #category : 'as yet unclassified' }
AppleTree >> growOneYear: frostStatus [ 
    age := age + 1.
    height := height + 0.5.
    isFruitYear := isFruitYear not. "Yield after year"

    (age >= fruitingAge)
			ifTrue:[  isFruitYear 
						ifTrue: [
        self increaseYield.
    ]].

]

{ #category : 'initialization' }
AppleTree >> initialize [ 
    species := 'RedApple'.
    age := 0.
    height := 2.0.
    yield := 0.
    fruitingAge := 0.
	 isFruitYear := true.
	 fruitColor:= 'Red' .
	 frostOccured := false.

]

{ #category : 'initialization' }
AppleTree >> initializeTree: aSpecies age: anAge height: aHeight yield: aYield fruitingAge: aFruitingAge frostOccured: afrostOccured fruitColor: aColor [  
    super initializeTree: aSpecies age: anAge height: aHeight yield: aYield fruitingAge: aFruitingAge frostOccured: afrostOccured.
    fruitColor := aColor.
    isFruitYear := true. "Apple tree gives fruits ine time per two years"
    

]

{ #category : 'printing' }
AppleTree >> printTree: aTranscript [ 
    aTranscript
        show: 'Species: ', species;  cr;
        show: '   Age: ', age printString;  cr;
        show: '   Height: ', height printString;  cr;
        show: '   Yield: ', yield printString;  cr;
        show: '   Fruiting Age: ', fruitingAge printString;  cr;
        show: '   Frost Occurred: ', frostOccured printString; cr;
        show: '   Fruit Color: ', fruitColor; cr;
        cr.  "New line"

]

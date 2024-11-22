Class {
	#name : 'FruitTreeCollection',
	#superclass : 'Object',
	#instVars : [
		'trees'
	],
	#category : 'ProjectFruitTree',
	#package : 'ProjectFruitTree'
}

{ #category : 'loading' }
FruitTreeCollection class >> loadFromCodeFile: pathString [
pathString asFileReference readStreamDo: [ :in | ^ Smalltalk compiler evaluate: in contents ]
]

{ #category : 'loading' }
FruitTreeCollection class >> loadFromStonFile: pathString [
pathString asFileReference readStreamDo: [ :in | ^ (STON reader on: in) next ]
]

{ #category : 'as yet unclassified' }
FruitTreeCollection class >> piclFileAndLoad: pattern [

	|pathString|
	pathString := UIManager default
			chooseFullFileNameMatching: { pattern }
			label: 'Choose file to open'.
	pathString ifNil: [ ^ nil ].
	'*.ston' = pattern ifTrue: [ ^self loadFromStonFile: pathString ].
	'*.stc' = pattern ifTrue: [ ^self loadFromCodeFile: pathString ].
	^ self error: 'Unknown type of file: ', pattern 
]

{ #category : 'adding' }
FruitTreeCollection >> addAppleTreeWithSpecies: species age: age height: height yield: yield fruitingAge: fruitingAge frostOccured: frostOccured [
    | newTree |
    
    "Create an AppleTree instance with provided parameters"
    newTree := AppleTree new initializeTree: species 
                                 age: age asInteger 
                                 height: height asInteger 
                                 yield: yield asInteger 
                                 fruitingAge: fruitingAge asInteger 
                                 frostOccured: frostOccured
                                 fruitColor: 'Red'.
    
    "Add the new tree to the collection"
    self addTree: newTree.
]

{ #category : 'adding' }
FruitTreeCollection >> addApricotTreeWithSpecies: species age: age height: height yield: yield fruitingAge: fruitingAge frostOccured: frostOccured [
    | newTree |
    
    "Create an ApricotTree instance with provided parameters"
    newTree := ApricotTree new initializeTree: species 
                                   age: age asInteger 
                                   height: height asInteger 
                                   yield: yield asInteger 
                                   fruitingAge: fruitingAge asInteger 
                                   frostOccured: frostOccured.
    
    "Add the new tree to the collection"
    self addTree: newTree.
]

{ #category : 'adding' }
FruitTreeCollection >> addTree: aTree [ 
    trees add: aTree.  "Add a new tree to the collection"

]

{ #category : 'adding' }
FruitTreeCollection >> addTreeInteractive [  
    | treeType species age height yield fruitingAge frostOccured newTree treeSelection |
    
    "Choose a tree type using a request dialog"
    treeSelection := UIManager default
        request: 'Choose a tree type (AppleTree or ApricotTree):'.

    "Validate the input to ensure it's either AppleTree or ApricotTree"
    (treeSelection = 'AppleTree' or: [treeSelection = 'ApricotTree']) ifFalse: [
        UIManager default inform: 'Invalid tree type! Please enter either AppleTree or ApricotTree.'.
        ^ self. "Exit the method if invalid"
    ].

    species := UIManager default request: 'Enter species name: '.
    age := UIManager default request: 'Enter age: ' .
    
    height := UIManager default request: 'Enter height: ' .
    yield := UIManager default request: 'Enter yield: '.
    fruitingAge := UIManager default request: 'Enter fruiting age: '.
    frostOccured := UIManager default request: 'Frost occurred? (1/0): '.
	 frostOccured := (frostOccured = '1') ifTrue: [true] ifFalse: [false].

    "Create a new tree based on the selection"
    newTree := treeSelection = 'AppleTree' 
        ifTrue: [AppleTree new initializeTree: species 
                                                 age: age asInteger 
                                                 height: height asInteger 
                                                 yield: yield asInteger 
                                                 fruitingAge: fruitingAge asInteger 
                                                 frostOccured: frostOccured
                                                 fruitColor: 'Red'] 
        ifFalse: [ApricotTree new initializeTree: species 
                                                age: age asNumber 
                                                height: height asNumber
                                                yield: yield asNumber
                                                fruitingAge: fruitingAge asNumber
                                                frostOccured: frostOccured ].

    self addTree: newTree.  "Add the new tree to the collection"
]

{ #category : 'as yet unclassified' }
FruitTreeCollection >> allTreesFruitingAge [ 
       | validTrees countFruitingTrees |

    validTrees := trees select: [:tree | 
        (tree isKindOf: FruitTree) and: [tree notNil].
    ].

    countFruitingTrees := validTrees count: [:tree | tree getAge >= tree getFruitingAge].
    ^ countFruitingTrees = validTrees size.
]

{ #category : 'as yet unclassified' }
FruitTreeCollection >> aveToFile: aFileName [
  	 | validTrees filePath fileHandle input output|
    
    "Фільтруємо дерева, залишаючи лише об'єкти типу FruitTree"
    validTrees := trees select: [:tree | 
        (tree notNil and: [tree isKindOf: FruitTree])
    ].
     
   filePath := FileSystem disk workingDirectory / aFileName.
   input := (validTrees collect: [:tree | tree asString ] ).
	output := File openForWriteFileNamed: filePath, aFileName.
	[ input atEnd ]
			whileFalse: [ output nextPut: input next ].
	input close.
	output close.

	"(FileSystem disk workingDirectory / aFileName) writeStream
  		nextPutAll: (validTrees collect: [:tree | tree asString ] ) ;
  		close."
]

{ #category : 'as yet unclassified' }
FruitTreeCollection >> createFruitTree: species age: anAge height: aHeight yield: aYield fruitingAge: aFruitingAge frostOccured: afrostOccured [
    "Creates a general fruit tree"
    ^FruitTree new
        initializeTree: species
        age: anAge
        height: aHeight
        yield: aYield
        fruitingAge: aFruitingAge
        frostOccured: afrostOccured
]

{ #category : 'as yet unclassified' }
FruitTreeCollection >> findMostProductiveTree [ 
       | validTrees |
    
    validTrees := trees select: [:tree | 
        (tree notNil and: [tree isKindOf: FruitTree])
    ].

    ^ validTrees inject: nil into: [:mostProductive :tree |
        (mostProductive isNil or: [tree getYield > mostProductive getYield]) 
            ifTrue: [tree] 
            ifFalse: [mostProductive].
    ].


]

{ #category : 'as yet unclassified' }
FruitTreeCollection >> findTallestTree [ 
       | validTrees |
    
    validTrees := trees select: [:tree | 
        (tree notNil and: [tree isKindOf: FruitTree])
    ].

    ^ validTrees inject: nil into: [:tallest :tree |
        (tallest isNil or: [tree getHeight > tallest getHeight]) 
            ifTrue: [tree] 
            ifFalse: [tallest].
    ].


]

{ #category : 'as yet unclassified' }
FruitTreeCollection >> findTopThreeMostProductiveTrees [ 
     | validTrees sortedTrees |
    
    "Filter the trees to keep only instances of FruitTree"
    validTrees := trees select: [:tree | 
        (tree notNil and: [tree isKindOf: FruitTree])
    ].

    "Sort the valid trees by yield"
    sortedTrees := validTrees sort: [:a :b | a getYield > b getYield].

    "Return the top three most productive trees"
    ^ sortedTrees size < 3 
        ifTrue: [sortedTrees] 
        ifFalse: [sortedTrees first: 3].
	 
]

{ #category : 'initialization' }
FruitTreeCollection >> initialize [ 
    trees := OrderedCollection new.  "Initialize the collection"

]

{ #category : 'as yet unclassified' }
FruitTreeCollection >> notifyTreesOfTwoYearsPassed [ 
     | validTrees |
    
    
    validTrees := trees select: [:tree | 
        (tree notNil and: [tree isKindOf: FruitTree])
    ].
    
    
    validTrees do: [:validTree | 
        validTree growOneYear: false.
    ].


]

{ #category : 'as yet unclassified' }
FruitTreeCollection >> notifyTreesOfYearPassed [ 
     | validTrees |
    
    
    validTrees := trees select: [:tree | 
        (tree notNil and: [tree isKindOf: FruitTree])
    ].
    
    
    validTrees do: [:validTree | 
        validTree growOneYear: false.
    ].

]

{ #category : 'printing' }
FruitTreeCollection >> printCollection: aTranscript [ 
   trees do: [:tree | 
        (tree isNil or: [tree isKindOf: FruitTreeCollection])
            ifTrue: [tree isNotNil ifTrue: [trees remove: tree]]  "Видаляємо об'єкт, якщо він є колекцією типу FruitTreeCollection або nil"
            ifFalse: [tree printTree: aTranscript]  "Друкуємо дерево, якщо це не колекція і не nil"
    ].

]

{ #category : 'saving' }
FruitTreeCollection >> printToFile: pathString [
	pathString asFileReference writeStreamDo: [ :out | 
		out nextPutAll: self printString ]
]

{ #category : 'saving' }
FruitTreeCollection >> saveToFile: pathString [
   
	pathString asFileReference writeStreamDo:  [ :out |
		out nextPutAll: (STON toString: self) ]
]

{ #category : 'saving' }
FruitTreeCollection >> storeToFile: pathString [

	pathString asFileReference writeStreamDo: [ :out |
		out nextPutAll: self storeString ]
]

{ #category : 'as yet unclassified' }
FruitTreeCollection >> treesNotExceedingHeight: aHeight [ 
    | validTrees |
    
    "Filter the trees to keep only instances of FruitTree"
    validTrees := trees select: [:tree | 
        (tree notNil and: [tree isKindOf: FruitTree])
    ].

    "Return the trees that do not exceed the specified height"
    ^ validTrees select: [:tree | tree getHeight <= aHeight].
]

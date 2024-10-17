Class {
	#name : 'MyTestClass',
	#superclass : 'Object',
	#instVars : [
		'counter'
	],
	#category : 'ProjectFruitTree',
	#package : 'ProjectFruitTree'
}

{ #category : 'accessing' }
MyTestClass >> counter [ [
    ^counter.
]
]

{ #category : 'accessing' }
MyTestClass >> counter: anInteger [
	"Method that sets *annteger* as a variable value"
	counter := anInteger
]

{ #category : 'API' }
MyTestClass >> decrement [ [
    counter := counter - 1.
]
]

{ #category : 'accessing' }
MyTestClass >> getCounter [ [
    ^counter.
]
]

{ #category : 'accessing' }
MyTestClass >> increment [ [
    counter := counter + 1.
]
]

{ #category : 'comparing' }
MyTestClass >> initialize [ [
        counter := 0. 
    ]
]

{ #category : 'accessing' }
MyTestClass >> setCounter: anInteger [
	"Method that sets *annteger* as a variable value"
	counter := anInteger
]

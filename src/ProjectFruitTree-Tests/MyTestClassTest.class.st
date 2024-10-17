"
A MyTestClassTest is a test class for testing the behavior of MyTestClass
"
Class {
	#name : 'MyTestClassTest',
	#superclass : 'TestCase',
	#category : 'ProjectFruitTree-Tests',
	#package : 'ProjectFruitTree-Tests'
}

{ #category : 'tests' }
MyTestClassTest >> testAging [
	"A test that will check if method decrement is working properly.
   Test value 10. Expested result is 12."

	| tree |
	tree := FruitTree new.
	tree
		initializeTree: 'Apricot Tree'
		age: 4
		height: 1
		yield: 10
		fruitingAge: 1
		frostOccured: true.
   tree printTree: Transcript .
	"Apply the decreaseYield method"
	tree growOneYear: true.
	self assert: tree getAge equals: 5
]

{ #category : 'basic tests' }
MyTestClassTest >> testCreatingMyTestClass [
  "A test that will check if the creation of an object MyCounter is done properly"
  |tmp|
  tmp := MyTestClass new.
  self deny: (tmp = nil)
]

{ #category : 'tests' }
MyTestClassTest >> testDecrementing [
	"A test that will check if method decrement is working properly.
   Test value 5. Expested result is 4."

	| classT |
	classT := MyTestClass new.
	classT counter: 5.
	classT decrement.
	self assert: classT getCounter equals: 4
]

{ #category : 'tests' }
MyTestClassTest >> testDecrising [
	"A test that will check if method decrement is working properly.
   Test value 10. Expested result is 12"

	| tree |
	tree := ApricotTree new.
	tree
		initializeTree: 'Apricot Tree'
		age: 4
		height: 1
		yield: 10
		fruitingAge: 1
		frostOccured: true.
   tree printTree: Transcript .
	"Apply the decreaseYield method"
	tree decreaseYield.
	self assert: tree getYield equals: 12
]

{ #category : 'tests' }
MyTestClassTest >> testIncreasing [
	"A test that will check if method decrement is working properly.
   Test value 10. Expested result is 12."

	| tree |
	tree := FruitTree new.
	tree
		initializeTree: 'Apricot Tree'
		age: 4
		height: 1
		yield: 10
		fruitingAge: 1
		frostOccured: true.
   tree printTree: Transcript .
	"Apply the decreaseYield method"
	tree increaseYield .
	self assert: tree getYield equals: 20
]

{ #category : 'tests' }
MyTestClassTest >> testIncrementing [
	"A test that will check if method increment is working properly. 
    Test value 5. Expected result 6."

	| counterT |
	counterT := MyTestClass new.
	counterT setCounter: 5.
	counterT increment .
	
	self assert: counterT getCounter equals: 6
]

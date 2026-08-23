!classDefinition: #Cuis category: 'Ejemplo-Cuis'!
Object subclass: #Cuis
	instanceVariableNames: 'distanciaRecorrida'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejemplo-Cuis'!

!Cuis methodsFor: 'as yet unclassified' stamp: 'II 23/Aug/2026, 1:44:46 am (UTC)'!
!methodProperties: {}!
correr: unaDistancia
	distanciaRecorrida := distanciaRecorrida + unaDistancia! !

!Cuis methodsFor: 'as yet unclassified' stamp: 'II 23/Aug/2026, 1:40:54 am (UTC)'!
!methodProperties: {}!
distanciaRecorrida
	^distanciaRecorrida! !

!Cuis methodsFor: 'as yet unclassified' stamp: 'II 23/Aug/2026, 1:15:27 am (UTC)'!
!methodProperties: {}!
estaCansado
	^distanciaRecorrida > (10 * kilometer)! !

!Cuis methodsFor: 'as yet unclassified' stamp: 'II 23/Aug/2026, 1:30:34 am (UTC)'!
!methodProperties: {}!
initialize
	distanciaRecorrida := 0 * kilometer.! !


!classDefinition: #CuisTest category: 'Ejemplo-Cuis'!
TestCase subclass: #CuisTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejemplo-Cuis'!

!CuisTest methodsFor: 'as yet unclassified' stamp: 'II 22/Aug/2026, 10:09:48 pm (UTC)'!
!methodProperties: {}!
test01UnCuisRecienNacidoNoEstaCansado
	| cuis |
	cuis := Cuis new.
	Assert isFalse: cuis estaCansado! !

!CuisTest methodsFor: 'as yet unclassified' stamp: 'II 23/Aug/2026, 1:22:51 am (UTC)'!
!methodProperties: {}!
test02UnCuisCuandoCorreMasDe10KilometrosSeCansa
	|cuis|
	cuis := Cuis new.
	cuis correr: 11 * kilometer.
	Assert isTrue: cuis estaCansado! !

!CuisTest methodsFor: 'as yet unclassified' stamp: 'II 23/Aug/2026, 1:22:20 am (UTC)'!
!methodProperties: {}!
test03UnCuisCuandoCorreMenosDe10KilometrosNoSeCansa
	|cuis|
	cuis := Cuis new.
	cuis correr: 8 * kilometer.
	Assert isFalse: cuis estaCansado! !

!CuisTest methodsFor: 'as yet unclassified' stamp: 'II 23/Aug/2026, 1:46:43 am (UTC)'!
!methodProperties: {}!
test04UnCuisConoceSuDistanciaRecorrida
	|cuis|
	cuis := Cuis new.
	cuis correr: 8 * kilometer.
	cuis correr: 4 * kilometer.
	
	Assert that: cuis distanciaRecorrida isEqualTo: 12 * kilometer! !

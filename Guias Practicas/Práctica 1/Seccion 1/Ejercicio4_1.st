!classDefinition: #I category: #'Numeros Naturales'!
DenotativeObject subclass: #I
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'I class' category: #'Numeros Naturales'!
I class
	instanceVariableNames: ''!

!I class methodsFor: 'as yet unclassified' stamp: 'II 18/Aug/2026, 12:50:17 am (UTC)'!
!methodProperties: {}!
* aMultiplicand
	^aMultiplicand! !

!I class methodsFor: 'as yet unclassified' stamp: 'II 18/Aug/2026, 12:16:40 am (UTC)'!
!methodProperties: {}!
+ anAdder
	|result previous|
	result := self next.
	previous := anAdder.
	
	[ self ~= (previous)] whileTrue: [
		result := result next.
		previous := previous previous
		].
	^result
	! !

!I class methodsFor: 'as yet unclassified' stamp: 'II 18/Aug/2026, 2:52:20 pm (UTC)'!
!methodProperties: {}!
- sustrahend
	self error: self descripcionDeErrorDeNumerosNegativosNoSoportados! !

!I class methodsFor: 'as yet unclassified' stamp: 'II 18/Aug/2026, 3:14:01 pm (UTC)'!
!methodProperties: {}!
/ divide
	(divide == I) ifTrue: [^self]. 
	self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor! !

!I class methodsFor: 'as yet unclassified' stamp: 'II 18/Aug/2026, 3:17:43 pm (UTC)'!
!methodProperties: {}!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	^'NoSePuedeDividirPorUnNumeroMayor'! !

!I class methodsFor: 'as yet unclassified' stamp: 'II 18/Aug/2026, 2:54:29 pm (UTC)'!
!methodProperties: {}!
descripcionDeErrorDeNumerosNegativosNoSoportados
	^'No se soportan Numeros Negativos'! !

!I class methodsFor: 'as yet unclassified' stamp: 'II 17/Aug/2026, 10:27:18 pm (UTC)'!
!methodProperties: {}!
next
	^II! !

!I class methodsFor: 'as yet unclassified' stamp: 'II 18/Aug/2026, 1:48:06 am (UTC)'!
!methodProperties: {}!
previous
    self error: 'No existe un natural anterior a I'.! !


!classDefinition: #II category: #'Numeros Naturales'!
DenotativeObject subclass: #II
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'II class' category: #'Numeros Naturales'!
II class
	instanceVariableNames: 'colaboratorNext colaboratorPrevious'!

!II class methodsFor: 'as yet unclassified' stamp: 'II 18/Aug/2026, 1:33:47 am (UTC)'!
!methodProperties: {}!
* aMultiplicand
	|result count|
	result := self.
	count := I.
	[count~= aMultiplicand] whileTrue: [
		result := result + self.
		count := count next].
	^result! !

!II class methodsFor: 'as yet unclassified' stamp: 'II 18/Aug/2026, 1:01:49 am (UTC)'!
!methodProperties: {}!
+ anAdder
	|result contador|
	result := self next.
	contador := I.
	
	[ anAdder ~= (contador)] whileTrue: [
		result := result next.
		contador := contador next
		].
	^result! !

!II class methodsFor: 'as yet unclassified' stamp: 'II 18/Aug/2026, 2:09:13 am (UTC)'!
!methodProperties: {}!
- sustrahend
	|result count|
	result := self previous .
	count := sustrahend.
	
	[ count~= I] whileTrue: [
		result := result previous.
		count := count previous ].
	^result.! !

!II class methodsFor: 'as yet unclassified' stamp: 'II 18/Aug/2026, 3:04:39 pm (UTC)'!
!methodProperties: {}!
/ divide
	|result dividend|
	(divide == I) ifTrue: [^self].
	
	dividend := self.
	"Verificamos que dividend >= divide "
	(divide esMayor: dividend) ifTrue: [self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor].
	
	result := I.
	[ dividend ~= divide] whileTrue: [
		dividend := dividend - divide.
		result := result next
		].
	
	^result! !

!II class methodsFor: 'as yet unclassified' stamp: 'II 18/Aug/2026, 3:07:47 pm (UTC)'!
!methodProperties: {}!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	^'NoSePuedeDividirPorUnNumeroMayor'
	! !

!II class methodsFor: 'as yet unclassified' stamp: 'II 18/Aug/2026, 2:16:38 pm (UTC)'!
!methodProperties: {}!
esMayor: number
	[self - number] on: Error do: [ ^false ].
	^true
	
	! !

!II class methodsFor: 'as yet unclassified' stamp: 'II 17/Aug/2026, 10:29:22 pm (UTC)'!
!methodProperties: {}!
next
	|colaboratorPreviousTemp|
	colaboratorPreviousTemp := colaboratorPrevious.

	colaboratorNext ifNil: [
		colaboratorPrevious := self.
		colaboratorNext := self cloneNamed: self name, 'I'].

	colaboratorPrevious := colaboratorPreviousTemp.
	^colaboratorNext ! !

!II class methodsFor: 'as yet unclassified' stamp: 'II 17/Aug/2026, 10:29:38 pm (UTC)'!
!methodProperties: {}!
previous
	^colaboratorPrevious ! !


!classDefinition: #III category: #'Numeros Naturales'!
DenotativeObject subclass: #III
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'III class' category: #'Numeros Naturales'!
III class
	instanceVariableNames: 'colaboratorNext colaboratorPrevious'!

!III class methodsFor: 'as yet unclassified' stamp: 'II 18/Aug/2026, 2:45:55 pm (UTC)'!
!methodProperties: {}!
* aMultiplicand
	|result count|
	result := self.
	count := I.
	[count~= aMultiplicand] whileTrue: [
		result := result + self.
		count := count next].
	^result! !

!III class methodsFor: 'as yet unclassified' stamp: 'II 18/Aug/2026, 2:45:55 pm (UTC)'!
!methodProperties: {}!
+ anAdder
	|result contador|
	result := self next.
	contador := I.
	
	[ anAdder ~= (contador)] whileTrue: [
		result := result next.
		contador := contador next
		].
	^result! !

!III class methodsFor: 'as yet unclassified' stamp: 'II 18/Aug/2026, 2:45:55 pm (UTC)'!
!methodProperties: {}!
- sustrahend
	|result count|
	result := self previous .
	count := sustrahend.
	
	[ count~= I] whileTrue: [
		result := result previous.
		count := count previous ].
	^result.! !

!III class methodsFor: 'as yet unclassified' stamp: 'II 18/Aug/2026, 3:06:12 pm (UTC)'!
!methodProperties: {}!
/ divide
	|result dividend|
	(divide == I) ifTrue: [^self].
	
	dividend := self.
	"Verificamos que dividend >= divide "
	(divide esMayor: dividend) ifTrue: [self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor].
	
	result := I.
	[ dividend ~= divide] whileTrue: [
		dividend := dividend - divide.
		result := result next
		].
	
	^result! !

!III class methodsFor: 'as yet unclassified' stamp: 'II 18/Aug/2026, 3:17:30 pm (UTC)'!
!methodProperties: {}!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	^'NoSePuedeDividirPorUnNumeroMayor'! !

!III class methodsFor: 'as yet unclassified' stamp: 'II 18/Aug/2026, 2:45:55 pm (UTC)'!
!methodProperties: {}!
esMayor: number
	[self - number] on: Error do: [ ^false ].
	^true
	
	! !

!III class methodsFor: 'as yet unclassified' stamp: 'II 18/Aug/2026, 2:45:55 pm (UTC)'!
!methodProperties: {}!
next
	|colaboratorPreviousTemp|
	colaboratorPreviousTemp := colaboratorPrevious.

	colaboratorNext ifNil: [
		colaboratorPrevious := self.
		colaboratorNext := self cloneNamed: self name, 'I'].

	colaboratorPrevious := colaboratorPreviousTemp.
	^colaboratorNext ! !

!III class methodsFor: 'as yet unclassified' stamp: 'II 18/Aug/2026, 2:45:55 pm (UTC)'!
!methodProperties: {}!
previous
	^colaboratorPrevious ! !


!classDefinition: #IIII category: #'Numeros Naturales'!
DenotativeObject subclass: #IIII
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros Naturales'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'IIII class' category: #'Numeros Naturales'!
IIII class
	instanceVariableNames: 'colaboratorNext colaboratorPrevious'!

!IIII class methodsFor: 'as yet unclassified' stamp: 'II 18/Aug/2026, 2:46:02 pm (UTC)'!
!methodProperties: {}!
* aMultiplicand
	|result count|
	result := self.
	count := I.
	[count~= aMultiplicand] whileTrue: [
		result := result + self.
		count := count next].
	^result! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'II 18/Aug/2026, 2:46:02 pm (UTC)'!
!methodProperties: {}!
+ anAdder
	|result contador|
	result := self next.
	contador := I.
	
	[ anAdder ~= (contador)] whileTrue: [
		result := result next.
		contador := contador next
		].
	^result! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'II 18/Aug/2026, 2:46:02 pm (UTC)'!
!methodProperties: {}!
- sustrahend
	|result count|
	result := self previous .
	count := sustrahend.
	
	[ count~= I] whileTrue: [
		result := result previous.
		count := count previous ].
	^result.! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'II 18/Aug/2026, 3:06:24 pm (UTC)'!
!methodProperties: {}!
/ divide
	|result dividend|
	(divide == I) ifTrue: [^self].
	
	dividend := self.
	"Verificamos que dividend >= divide "
	(divide esMayor: dividend) ifTrue: [self error: self descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor].
	
	result := I.
	[ dividend ~= divide] whileTrue: [
		dividend := dividend - divide.
		result := result next
		].
	
	^result! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'II 18/Aug/2026, 2:59:32 pm (UTC)'!
!methodProperties: {}!
descripcionDeErrorDeNoSePuedeDividirPorUnNumeroMayor
	^'NoSePuedeDividirPorUnNumeroMayor'! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'II 18/Aug/2026, 2:46:02 pm (UTC)'!
!methodProperties: {}!
esMayor: number
	[self - number] on: Error do: [ ^false ].
	^true
	
	! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'II 18/Aug/2026, 2:46:02 pm (UTC)'!
!methodProperties: {}!
next
	|colaboratorPreviousTemp|
	colaboratorPreviousTemp := colaboratorPrevious.

	colaboratorNext ifNil: [
		colaboratorPrevious := self.
		colaboratorNext := self cloneNamed: self name, 'I'].

	colaboratorPrevious := colaboratorPreviousTemp.
	^colaboratorNext ! !

!IIII class methodsFor: 'as yet unclassified' stamp: 'II 18/Aug/2026, 2:46:02 pm (UTC)'!
!methodProperties: {}!
previous
	^colaboratorPrevious ! !

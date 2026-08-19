!classDefinition: #I category: 'Numeros_Naturales_Romanos'!
DenotativeObject subclass: #I
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros_Naturales_Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'I class' category: 'Numeros_Naturales_Romanos'!
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


!classDefinition: #II category: 'Numeros_Naturales_Romanos'!
DenotativeObject subclass: #II
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Numeros_Naturales_Romanos'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'II class' category: 'Numeros_Naturales_Romanos'!
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

!II class methodsFor: 'as yet unclassified' stamp: 'II 19/Aug/2026, 9:09:28 pm (UTC)'!
!methodProperties: {}!
nameOfNext
	"Para todo número que termine con XXXIX el siguiente es -> XL"
	(self name endsWith: 'XL') ifTrue: [^(self name withoutSuffix: 'XL'), 'L'].

	"Para todo número que termine con XXXIX el siguiente es -> XL"
	(self name endsWith: 'XXXIX') ifTrue: [^(self name withoutSuffix: 'XXXIX'), 'XL'].
	
	"Para todo número que termine con IX el siguiente es -> X"
	(self name endsWith: 'IX') ifTrue: [^(self name withoutSuffix: 'IX'), 'X'].
	
	"Para todo número que termine con VIII el siguiente es -> IX"
	(self name endsWith: 'VIII') ifTrue: [^(self name withoutSuffix: 'VIII'), 'IX'].
	
	"Para todo número que termine con III el siguiente es -> IV"
	(self name endsWith: 'IV') ifTrue: [^(self name withoutSuffix: 'IV'), 'V'].

	"Para todo número que termine con III el siguiente es -> IV"
	(self name endsWith: 'III') ifTrue: [^(self name withoutSuffix: 'III'), 'IV'].
		
	^ self name,'I'! !

!II class methodsFor: 'as yet unclassified' stamp: 'II 19/Aug/2026, 8:54:11 pm (UTC)'!
!methodProperties: {}!
next
	|colaboratorPreviousTemp|
	colaboratorPreviousTemp := colaboratorPrevious.

	colaboratorNext ifNil: [
		colaboratorPrevious := self.
		colaboratorNext := self cloneNamed: self nameOfNext].

	colaboratorPrevious := colaboratorPreviousTemp.
	^colaboratorNext ! !

!II class methodsFor: 'as yet unclassified' stamp: 'II 17/Aug/2026, 10:29:38 pm (UTC)'!
!methodProperties: {}!
previous
	^colaboratorPrevious ! !

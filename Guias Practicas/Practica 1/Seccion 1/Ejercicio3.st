!classDefinition: #Falso category: #'Algebra de Boole'!
DenotativeObject subclass: #Falso
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Algebra de Boole'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Falso class' category: #'Algebra de Boole'!
Falso class
	instanceVariableNames: ''!

!Falso class methodsFor: 'as yet unclassified' stamp: 'HAW 13/Aug/2026, 8:15:26 pm (UTC)'!
!methodProperties: {}!
no
	^Verdadero ! !

!Falso class methodsFor: 'as yet unclassified' stamp: 'HAW 13/Aug/2026, 8:14:27 pm (UTC)'!
!methodProperties: {}!
o: unBooleano
	^unBooleano! !

!Falso class methodsFor: 'as yet unclassified' stamp: 'HAW 13/Aug/2026, 8:17:17 pm (UTC)'!
!methodProperties: {}!
siFalso: unaAccionARealizarUIgnorar
	unaAccionARealizarUIgnorar value! !

!Falso class methodsFor: 'as yet unclassified' stamp: 'HAW 13/Aug/2026, 8:17:32 pm (UTC)'!
!methodProperties: {}!
siVerdadero: unaAccionARealizarUIgnorar! !

!Falso class methodsFor: 'as yet unclassified' stamp: 'HAW 13/Aug/2026, 8:14:07 pm (UTC)'!
!methodProperties: {}!
y: unBooleano
	^Falso! !


!classDefinition: #TestDeBooleanos category: #'Algebra de Boole'!
DenotativeObject subclass: #TestDeBooleanos
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Algebra de Boole'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'TestDeBooleanos class' category: #'Algebra de Boole'!
TestDeBooleanos class
	instanceVariableNames: ''!

!TestDeBooleanos class methodsFor: 'Negado' stamp: 'HAW 13/Aug/2026, 8:31:44 pm (UTC)'!
!methodProperties: {}!
test01VerdaderoNegadoEsFalso
	Assert that: Verdadero no isEqualTo: Falso! !

!TestDeBooleanos class methodsFor: 'Negado' stamp: 'HAW 13/Aug/2026, 8:32:43 pm (UTC)'!
!methodProperties: {}!
test02FalsoNegadoEsVerdadero
	Assert that: Falso no isEqualTo: Verdadero! !


!TestDeBooleanos class methodsFor: 'Y' stamp: 'HAW 13/Aug/2026, 8:32:54 pm (UTC)'!
!methodProperties: {}!
test03VerdaderoYVerdaderoEsVerdadero
	Assert that: (Verdadero y: Verdadero) isEqualTo: Verdadero
! !

!TestDeBooleanos class methodsFor: 'Y' stamp: 'HAW 13/Aug/2026, 8:42:53 pm (UTC)'!
!methodProperties: {}!
test04VerdaderoYFalsoEsFalso
	Assert that: (Verdadero y: Falso) isEqualTo: Falso! !

!TestDeBooleanos class methodsFor: 'Y' stamp: 'HAW 13/Aug/2026, 8:43:21 pm (UTC)'!
!methodProperties: {}!
test05FalsoYVerdaderoEsFalso
	Assert that: (Falso y: Verdadero) isEqualTo: Falso! !

!TestDeBooleanos class methodsFor: 'Y' stamp: 'HAW 13/Aug/2026, 8:33:02 pm (UTC)'!
!methodProperties: {}!
test06FalsoYFalsoEsFalso
	Assert  that: (Falso y: Falso) isEqualTo: Falso! !


!TestDeBooleanos class methodsFor: 'siVerdadero' stamp: 'HAW 13/Aug/2026, 8:33:16 pm (UTC)'!
!methodProperties: {}!
test11VerdaderoSiVerdaderoRealizarAccion
	|realizarAccion|
	realizarAccion := Falso.
	
	"Es un bloque [...] , si se ejecuta el bloque entonces se realiza la Accion"
	Verdadero siVerdadero: [realizarAccion := Verdadero].
	
	Assert that: realizarAccion isEqualTo: Verdadero! !

!TestDeBooleanos class methodsFor: 'siVerdadero' stamp: 'HAW 13/Aug/2026, 8:33:09 pm (UTC)'!
!methodProperties: {}!
test12FalsoSiVerdaderoIgnorar
	|realizarAccion|
	realizarAccion := Falso.
	
	"Es un bloque [...] , si se ejecuta el bloque entonces es porque se realizo la acción"
	Falso siVerdadero: [realizarAccion := Verdadero].
	
	Assert that: realizarAccion isEqualTo: Falso! !


!TestDeBooleanos class methodsFor: 'O' stamp: 'HAW 13/Aug/2026, 8:33:23 pm (UTC)'!
!methodProperties: {}!
test07VerdaderoOVerdaderoEsVerdadero
	Assert that: (Verdadero o: Verdadero) isEqualTo: Verdadero
! !

!TestDeBooleanos class methodsFor: 'O' stamp: 'HAW 13/Aug/2026, 8:33:27 pm (UTC)'!
!methodProperties: {}!
test08VerdaderoOFalsoEsVerdadero
	Assert that: (Verdadero o: Falso) isEqualTo: Verdadero
! !

!TestDeBooleanos class methodsFor: 'O' stamp: 'HAW 13/Aug/2026, 8:33:36 pm (UTC)'!
!methodProperties: {}!
test09FalsoOVerdaderoEsVerdadero
	Assert that: (Falso o: Verdadero) isEqualTo: Verdadero
! !

!TestDeBooleanos class methodsFor: 'O' stamp: 'HAW 13/Aug/2026, 8:33:40 pm (UTC)'!
!methodProperties: {}!
test10FalsoOFalsoEsFalso
	Assert that: (Falso o: Falso) isEqualTo: Falso
! !


!TestDeBooleanos class methodsFor: 'siFalso' stamp: 'HAW 13/Aug/2026, 8:33:56 pm (UTC)'!
!methodProperties: {}!
test13VerdaderoSiFalsoIgnorar
	|realizarAccion|
	realizarAccion := Falso.
	
	"Es un bloque [...] , si se ejecuta el bloque entonces es porque se realizo la acción"
	Verdadero siFalso: [realizarAccion := Verdadero].
	
	Assert that: realizarAccion isEqualTo: Falso! !

!TestDeBooleanos class methodsFor: 'siFalso' stamp: 'HAW 13/Aug/2026, 8:33:50 pm (UTC)'!
!methodProperties: {}!
test14FalsoSiFalsoIgnorar
	|realizarAccion|
	realizarAccion := Falso.
	
	"Es un bloque [...] , si se ejecuta el bloque entonces es porque se realizo la acción"
	Falso siFalso: [realizarAccion := Verdadero].
	
	Assert that: realizarAccion isEqualTo: Verdadero! !


!classDefinition: #Verdadero category: #'Algebra de Boole'!
DenotativeObject subclass: #Verdadero
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Algebra de Boole'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Verdadero class' category: #'Algebra de Boole'!
Verdadero class
	instanceVariableNames: ''!

!Verdadero class methodsFor: 'as yet unclassified' stamp: 'HAW 13/Aug/2026, 8:15:39 pm (UTC)'!
!methodProperties: {}!
no
	^Falso ! !

!Verdadero class methodsFor: 'as yet unclassified' stamp: 'HAW 13/Aug/2026, 8:15:06 pm (UTC)'!
!methodProperties: {}!
o: unBooleano
	^Verdadero ! !

!Verdadero class methodsFor: 'as yet unclassified' stamp: 'HAW 13/Aug/2026, 8:17:03 pm (UTC)'!
!methodProperties: {}!
siFalso: unaAccionARealizarUIgnorar! !

!Verdadero class methodsFor: 'as yet unclassified' stamp: 'HAW 13/Aug/2026, 8:16:13 pm (UTC)'!
!methodProperties: {}!
siVerdadero: unaAccionARealizarUIgnorar
	unaAccionARealizarUIgnorar value! !

!Verdadero class methodsFor: 'as yet unclassified' stamp: 'HAW 13/Aug/2026, 8:14:53 pm (UTC)'!
!methodProperties: {}!
y: unBooleano
	^unBooleano! !

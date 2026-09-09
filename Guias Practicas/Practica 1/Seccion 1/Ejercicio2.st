!classDefinition: #Bill category: #'Ejercicio 2'!
DenotativeObject subclass: #Bill
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Ejercicio 2'!

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Bill class' category: #'Ejercicio 2'!
Bill class
	instanceVariableNames: 'diasDeVida'!

!Bill class methodsFor: 'as yet unclassified' stamp: 'HAW 13/Aug/2026, 6:14:12 pm (UTC)'!
!methodProperties: {}!
caminar: unaCantidadDeKilometros
	|unaCantidadDeKilometrosEnDias| 
	unaCantidadDeKilometrosEnDias := (unaCantidadDeKilometros/(1*kilometer))*day.
	diasDeVida := diasDeVida - (unaCantidadDeKilometrosEnDias + (3*day))! !

!Bill class methodsFor: 'as yet unclassified' stamp: 'HAW 13/Aug/2026, 4:53:22 pm (UTC)'!
!methodProperties: {}!
comer: unaCantidadDeKilosDeCerebro
	| unaCantidadDeKilosDeCerebroEnDias |
	unaCantidadDeKilosDeCerebroEnDias := (unaCantidadDeKilosDeCerebro ​/ (1*kilogram))*day.
	diasDeVida := diasDeVida + (unaCantidadDeKilosDeCerebroEnDias*4).! !

!Bill class methodsFor: 'as yet unclassified' stamp: 'HAW 13/Aug/2026, 3:42:17 pm (UTC)'!
!methodProperties: {}!
energia
	^diasDeVida ! !

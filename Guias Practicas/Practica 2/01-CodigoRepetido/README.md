# Codigo repetido

Consejos para nombrar los metodos:
1. Nombrá la intención, no los pasos
2. Si el código calcula algo, usá un nombre que represente el resultado
3. Si hace una acción, usá un verbo
4. Evitá nombres demasiado genéricos
5. Si tuviera que explicarle a otra persona qué hace este código sin mostrarle cómo lo hace, ¿qué diría?

Vamos a debuggear cada test y ver que cambios podemos hacer a los metodos de los mensajes dados en cada test.

### addCustomerNamed: aName

```smalltalk
addCustomerNamed: aName

	aName isEmpty ifTrue: [ self signalCustomerNameCannotBeEmpty ].
	((active includes: aName) or: [suspended includes: aName]) ifTrue: [ self signalCustomerAlreadyExists ].
	
	active add: aName 
```

Podemos refactorizar `(active includes: aName) or: [suspended includes: aName]` ->  `self includesCustomerNamed: aName`


### removeCustomerNamed: aName

```
removeCustomerNamed: aName 
 
"Primer metodo"
	1 to: active size do: 
	[ :index |
		aName = (active at: index)
			ifTrue: [
				active removeAt: index.
				^ aName 
			] 
	].

"Segundo metodo"
	1 to: suspended size do: 	
	[ :index |
		aName = (suspended at: index)
			ifTrue: [
				suspended removeAt: index.
				^ aName 
			] 
	].
	
	^ NotFound signal.
```

* Notar que ambos código cumplen con una misma función, buscar el nombre del cliente en su colección.
* Refactorizamos este metodo. Inicialmente podemos extraer el primer metodo desde el browse-> Refactorings -> `extract method` -> Original Selection -> Y por el momento lo nombramos removeCustomerNameInActiveCustomers: aName

```smalltalk
removeCustomerNamed: aName 
 
	self removeCustomerNameInActiveCustomers: aName returningWith: [ :res | ^ res ].

	1 to: suspended size do: 	
	[ :index |
    ...

"Por el momento va quedando asi"

removeCustomerNameInActiveCustomers: aName returningWith: aReturningBlock

	1 to: active size do: 
	[ :index |
		aName = (active at: index)
			ifTrue: [
				active removeAt: index.
				^ aReturningBlock value: aName 
			] 
	]
```

Ahora nosotros queremos reutilizar removeCustomerNameInActiveCustomers también para clientes suspendidos. De nuevo refactorizamos `removeCustomerNameInActiveCustomers` agregandole un parametro más. Entonces vamos a querer que elimine un cliente en la colección correspondiente. Refactorings -> `Add Parameter` -> customers -> active , Y lo colocamos antes de bloquederetorno -> fromCustomers. Con un scope solo en la Clase.   

```smalltalk
removeCustomerNamed: aName 
 
	self removeCustomerNameInActiveCustomers: aName fromCustomers: active returningWith: [ :res | ^ res ].

	1 to: suspended size do: 	
	[ :index |
    ...
```

VERIFICAR QUE AÚN CORRAN LOS TESTS. Efectivamente corren. Por último modificamos este nuevo metodo para que utilice al parametro agregado. Y luego refactorizamos su nombre.


```smalltalk
removeCustomerName: aName fromCustomers: customers returningWith: aReturningBlock

	1 to: customers size do: 
	[ :index |
		aName = (customers at: index)
			ifTrue: [
				customers removeAt: index.
				^ aReturningBlock value: aName 
			] 
	]
```




```smalltalk
removeCustomerNamed: aName 
 
	self removeCustomerName: aName fromCustomers: active returningWith: [ :res | ^ res ].
	self removeCustomerName: aName fromCustomers: suspended returningWith: [ :res | ^ res ].
	
	^ NotFound signal.
```

## Tests


### Test7 y Test8

```samlltalk
test07CanNotSuspendAnInvalidCustomer
	
	...

	[ customerBook suspendCustomerNamed: 'Ringo Starr'.
	self fail ]
		on: CantSuspend 
		do: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]
```

```smalltalk
test08CanNotSuspendAnAlreadySuspendedCustomer
	
	...
	
	[ customerBook suspendCustomerNamed: johnLennon.
	self fail ]
		on: CantSuspend 
		do: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: johnLennon) ]
```

Esos últimos dos fragemntos comparten similitud. Lo unico que cambia es el argumento que recibe `suspendCustomerNamed:`.
Primero, ¿Qué hace esta implementación? Verifica que suspender a un cliente no sea posible (Me de error) y que el cliente JohnLennon siga siendo un cliente (Es decir que no se produzca ningún cambio).\
Refactorizamos el pedazo de código repetido del test7, haremos un `extract method`. Como este pedacito de codígo recibe dos parametros y como es un test que verifica vamos a llamar al nuevo método  -> assertCantSuspendAnCustomerWhenIsSuspended: aName in: customerBook

```smalltalk
assertCantSuspendACustomerWhenIsSuspended: aName in: customerBook

	^ [ customerBook suspendCustomerNamed: aName.
	self fail ]
		on: CantSuspend 
		do: [ :anError | 
			self assert: customerBook numberOfCustomers = 1.
			self assert: (customerBook includesCustomerNamed: 'John Lennon') ]
```

Luego los tests quedarian

```
test07CanNotSuspendAnInvalidCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	
	self assertCantSuspendACustomerWhenIsSuspended: 'Ringo Starr' in: customerBook.


test08CanNotSuspendAnAlreadySuspendedCustomer
	
	| customerBook johnLennon |
			
	customerBook := CustomerBook new.
	johnLennon := 'John Lennon'.
	customerBook addCustomerNamed: johnLennon.
	customerBook suspendCustomerNamed: johnLennon.
	
	self assertCantSuspendACustomerWhenIsSuspended: johnLennon in: customerBook

```




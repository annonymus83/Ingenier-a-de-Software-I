# Sección 2. Introducción al lenguaje Smalltalk

## 0. Debugger

### Ejercicio 0.1

La podemos encontrar en [Auxiliares](https://github.com/annonymus83/Ingenier-a-de-Software-I/blob/main/Auxiliares/CuisUniversity.md#debugger)

### Ejercicio 0.2

* Into: entra a la impementación de cada mensaje que se esta enviando dentro de una colaboración.
* Over: ejecuta la colaboración seleccionada y pasa la siguiente colaboración.
* Through: no lo encuentro ??
* Restart: reinicializa la ejecución de lo que estamos debuggeando a partir de la colaboración que tengamos seleccionada (1)


*Recorrer el código con Into hasta la última línea del método m2. Luego hacer Restart. ¿Dónde queda ubicado el debugger? ¿Cuál es el valor de aVar*?

El debugger inicia de  nuevo en la primera colaboración, y el valor de aVar pasa a ser 43. Es decir una vez ejecutada la asignación a un colaborador interno en la colaboración dentro del debugger su valor no se reinicia al hacer restart lo cual nos puede llegar a perjudicar si es que era necesaria ese estado inicial.

## 1.Colecciones

### Ejercicio 1.1

**a) Colección Array**

```
x:= #(5 4 3 2).
x at: 1 put: 42.
x asString '#(42 4 3 2)'
```

Si queremos agregar un elemento en la posición 5 nos da error, puesto que no existe posición 5 en este array.
Para agregar otro elemento podemos agregar la siguiente colaboración:

```
x := x copyWith 40.
```

NOTA: esto no modifica a x sino que hace una copia del mismo y se autoasigna de nuevo.


**b) Ordered Collections**

Actua como un array expandible

```
x := OrderedCollection with: 4 with: 3 with: 2 with: 1.​
x add: 42.
x add:2.

"Para saber su tamaño"
x size 6.

"Para ver el la colección"
x asString 'an OrderedCollection(4 3 2 1 42 2)'
```

Tiene 6 elementos y puede guardar elementos repetidos.


**c) Sets**

```
x := OrderedCollection with: 4 with: 3 with: 2 with: 1.​
x add: 42.
x add:2.
x size.
x asString 'a Set(42 4 3 2 1)'
```

Actua como set y NO guarda elementos repetidos.


**c) Dictionary**

```
"Agrego (e:42) y veo su tamaño"
x := Dictionary new.
x add: #a->4; add: #b->3; add: #c->1; add: #d->2; yourself.
x add: #e->42.
x size 5.

"Listamos las keys"
x keys #(#b #a #e #d #c).

"Listamos las values"
x values #(3 4 42 2 1).

"Obtener un valor"
x at: #a 4.

"Obtener valor de #z si esta y sino retoprnar 24"
(x includesKey: #z) ifFalse: [^24].
x at: #z 24.
```


### Ejercicio 1.2

```
x:= #(42 4 3 2).

"Array en OrderedCollection"
y := x asOrderedCollection.
y asString 'an OrderedCollection(4 3 2 1)'.

"Array en Set"
z := x asSet.
z asString 'an Set(4 3 2 1)'.

"Set a Array"
z asArray #(4 3 2 1).

"Dictionary en array"
x := Dictionary new.
x add: #a->4; add: #b->3; add: #c->6; yourself.
x asArray #(3 4 6)
ME LISTA SOLO LOS VALUES

```

### Ejercicio 1.3

Secuencia de colaboraciones para hallar números impares dentro de un array.

```
| elements index odds |
​elements:= #(1 2 5 6 9).
​
​odds := OrderedCollection new.
index := 1.​

​[index <= elements size]
whileTrue: [
    ((elements at: index) odd) ifTrue: [odds add: (elements at: index)].
    index := index +1.
].

^odds
```

### Ejercicio 1.4
No encontre otro Workspace.

### Ejercicio 1.5
* `Do it`: ejecuta la/s colaboracione/s seleccionada/s.
* `Print it`: Imprime lo que devuelte la ultima colaboración seleccionada.
* `Explore it`: Explora los datos del objeto y ejecuta la colaboración.
* `Debug it`: Abre el Debugger para ver la ejecución de la colaboración.

### Ejercicio 1.6

### Ejercicio 1.7
* Mucho texto
* Se puede buscar impares con busqueda binaria.

### Ejercicio 1.8

```
| elements odds |
​elements:= #(1 3 8 7 2).
​
​odds := OrderedCollection new.
elements do: [:a | a odd ifTrue: [odds add: a] ].  

^odds
```

No es necesario de un Index, se reduce la cantidad de mensajes y es más legible.


### Ejercicio 1.9

```
| elements odds |
​elements:= #(1 3 8 7 2).
odds := elements select: [:a | a odd].
^odds
```

No requerimos llamar del mensaje ifTrue, se vuelve más corto y legible el código.

### Ejercicio 1.10

### Ejercicio 1.11

```
|elements index|
​elements:= #(1 2 5).
​
index := 1.​
​[index <= elements size]
whileTrue: [
    dobles at:index put: (elements at: index)*2.
    index := index +1.
].

^elements
```

Los resultados se acumulan en el mismo array.


```
|elements dobles|
​elements:= #(1 2 5).
​
dobles := OrderedCollection new.
elements do: [:a | dobles add: a*2].
^dobles
```

Necesitamos de una colección o Set para guardar los elementos.


### Ejercicio 1.12

```
|elements dobles|
​elements := OrderedCollection new.
​elements addAll: #(1 2 5).

dobles := elements collect: [:a | a*2].
^dobles
```

Retrona una colección.

### Ejercicio 1.13

Encontrar número par

```
"Con WHILE"
|elements index|
​elements:= #(1 2 5 6 9).
​
index := 1.​
​[index <= elements size]
whileTrue: [
    (elements at: index) even ifTrue: [^elements at: index]. 
    index := index +1.
].

"Con DO:"
|elements|
​elements := OrderedCollection new.
​elements addAll: #(1 2 5 6 9).
​
elements do: [:a | a even ifTrue: [^a]]

"Con detect"
|elements|
​elements := OrderedCollection new.
​elements addAll: #(1 2 5 6 9).
​elements detect: [:a | a even] ifNone: [].

```

### Ejercicio 1.14
Como decidi no retornar nada, no ocurre nada. Puede imprimir nil.

### Ejercicio 1.15

Agrego al final de cada implementación:

```smalltalk
self error: 'No hay pares'
```

### Ejercicio 1.16
Sumar todos los elementos de una colección

```
"Con WHILE"
|elements index sum|
​elements := OrderedCollection new.
​elements addAll: #(1 2 5).
index := 1.​
sum:= 0.
​[index <= elements size]
whileTrue: [
    sum := sum + (elements at: index).
    index := index +1.
].
^sum

"Con DO:"
|elements sum|
​elements := OrderedCollection new.
​elements addAll: #(1 2 5).
​sum:= 0.
elements do: [:a | sum := sum + a].
^sum

"Con For"
|elements sum|
​elements := OrderedCollection new.
​elements addAll: #(1 2 5).
sum := 0. 
1 to: (elements size) 
            do: [:a | sum := sum + (elements at: a)].
^sum

"Con INJECT"
|elements sum|
​elements := OrderedCollection new.
​elements addAll: #(1 2 5).
sum := 0. 
sum := elements inject: 0 into: [:a :c | a + c].
^sum
```

### Ejercicio 1.17
`inject: into:` recibe dos colaboradores externos. Y un colaborador temporal dentro.

### Ejercicio 1.18
Select en String.

```
|x y|
x := 'abcdefguijp'.
y := x select: [ :a | (a = $a) | (a = $e) | (a = $i)| (a = $o)| (a = $u)].
^y
```

### Ejercicio 1.19

## 2. Bloques (Closures)

> *Blocks are objects used in many of the control structures in the Smalltalk-80 system. A block represents a deferred sequence of actions. A block expression consists of a sequence of expressions separated by periods and delimited by square brackets.*

* `[block expression]` : Podemos crear un bloque encerrandolo entre [] y colocar todas las colaboraciones que queramos que se ejecuten.
* `value`: Un bloque no se ejecuta automaticamente, para ello utilizamos el valor **value** asi: `[block expression] value`
* **Retorno**: el Bloque retorna la última expresión (colaboración) dada. `Index := [ 1 + 2. Index + 1] value`
* **Asignación**: Un bloque puede ser asignado a una variable: `x := [block expression]`. Para ser ejecutado más tardes (si queremos) 

### Ejercicio 2.c

```
|x|
x := [ y := 1. z := 2. ].
x value.
```

- **i)** Podemos acceder a los valores definidas dentro de un bloque siempre y cuando se ejecute el bloque.

- **ii)** Idem.

**Parametros de un Bloque**

```
x := [ :argOne :argTwo |   argOne, ' and ' , argTwo.].      "set up block with argument passing"
Transcript show: (x value: 'First' value: 'Second'); cr.
```

Ejemplo:
```
|sum|
x := [:a :b | sum:= a + b].
x value: 4 value:6.
^sum
```

## 3. Símbolos
> *Symbols are objects that represent strings used for names in the system. The literal representation of a symbol is a sequence of alphanumeric characters preceded by a pound sign (#)*
NUNCA DEBE HABER DOS SIMBOLOS CON EL MISMO NOMBRE, cada simbolo es unico. De esta forma podemos compararlos eficientemente. 

### Ejercicio 3.b
```
`
|x y|
x := #pepe.
y := #pepe.
x = y
```
Devuelve True

### Ejercicio 3.b - concatenación
#Hello , #World, #!​ -> 'HelloWorld!'.

## 4. Medidas

### Ejercicio 4.2
```
10*peso + 10*dollar -> MessadgeNotUnderstood
```

Esperaba :  10*dollar + 10\*peso .


### Ejercicio 4.3

```
10*peso + (10*dollar)
expected: 10*peso + 10*dollar
result:  10 * dollar+10 * peso .

10*peso + (10*dollar) - (2*dollar)
expected: 10*dollar + 10*peso - 2*dollar 
result:  10 * peso + 8 * dollar.

10*peso + (10*dollar) - (2*dollar) - (8*dollar)
expected: 10*peso
result: 10*peso
```

### Ejercicio 4.4

```
peso inspect
```
Es unidad base para representar al peso monetario.

### Ejercicio 4.5
```
(10 * peso) amount 10 .
(10 * peso) unit peso .
```

### Ejercicio 4.6
1 amount 1. -> El 1 tiene monto 1
1 unit . -> No tienen ninguna unidad


### Ejercicio 4.7

```
(10*peso) + 1 -> 10*peso + 1
1 + (10*peso) -> 10*peso + 1
```


```
(10 * peso) * 5 -> 50*peso
(10 * peso) * (5 * peso) -> 50 * peso*peso .
```

### Ejercicio 4.8
```
peso := BaseUnit nameForOne: 'peso' nameForMany: 'pesos' sign: $$
```

$$ representa al signo $.


### Ejercicio 4.9



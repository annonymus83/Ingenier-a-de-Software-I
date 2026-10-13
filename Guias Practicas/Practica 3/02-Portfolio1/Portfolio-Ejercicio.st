!classDefinition: #AccountTransaction category: #'Portfolio-Ejercicio'!
Object subclass: #AccountTransaction
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!AccountTransaction methodsFor: 'value' stamp: 'HernanWilkinson 12/Sep/2011, 3:25:00 pm (UTC)'!
!methodProperties: {}!
value 

	self subclassResponsibility ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'AccountTransaction class' category: #'Portfolio-Ejercicio'!
AccountTransaction class
	instanceVariableNames: ''!

!AccountTransaction class methodsFor: 'instance creation' stamp: 'NR 17/Oct/2019, 6:22:00 am (UTC)'!
!methodProperties: {}!
register: aValue on: account

	| transaction |
	
	transaction := self for: aValue.
	account register: transaction.
		
	^ transaction! !


!classDefinition: #Deposit category: #'Portfolio-Ejercicio'!
AccountTransaction subclass: #Deposit
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Deposit methodsFor: 'initialization' stamp: 'HernanWilkinson 13/Jul/2011, 9:45:00 pm (UTC)'!
!methodProperties: {}!
initializeFor: aValue

	value := aValue ! !


!Deposit methodsFor: 'value' stamp: 'HernanWilkinson 13/Jul/2011, 9:38:00 pm (UTC)'!
!methodProperties: {}!
value

	^ value! !


!Deposit methodsFor: 'as yet unclassified' stamp: 'II 12/Oct/2026, 8:50:59 pm (UTC)'!
!methodProperties: {}!
calcularBalance: balanceParcial 
	^balanceParcial + value ! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Deposit class' category: #'Portfolio-Ejercicio'!
Deposit class
	instanceVariableNames: ''!

!Deposit class methodsFor: 'instance creation' stamp: 'HernanWilkinson 13/Jul/2011, 9:38:00 pm (UTC)'!
!methodProperties: {}!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Withdraw category: #'Portfolio-Ejercicio'!
AccountTransaction subclass: #Withdraw
	instanceVariableNames: 'value'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Withdraw methodsFor: 'initialization' stamp: 'HernanWilkinson 13/Jul/2011, 9:46:00 pm (UTC)'!
!methodProperties: {}!
initializeFor: aValue

	value := aValue ! !


!Withdraw methodsFor: 'value' stamp: 'HernanWilkinson 13/Jul/2011, 9:33:00 pm (UTC)'!
!methodProperties: {}!
value

	^ value! !


!Withdraw methodsFor: 'as yet unclassified' stamp: 'II 12/Oct/2026, 8:52:21 pm (UTC)'!
!methodProperties: {}!
calcularBalance: balanceParcial 
	^balanceParcial - value! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Withdraw class' category: #'Portfolio-Ejercicio'!
Withdraw class
	instanceVariableNames: ''!

!Withdraw class methodsFor: 'instance creation' stamp: 'HernanWilkinson 13/Jul/2011, 9:33:00 pm (UTC)'!
!methodProperties: {}!
for: aValue

	^ self new initializeFor: aValue ! !


!classDefinition: #Portfolio category: #'Portfolio-Ejercicio'!
Object subclass: #Portfolio
	instanceVariableNames: 'accountsAndPortfolios transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!Portfolio methodsFor: 'as yet unclassified' stamp: 'II 13/Oct/2026, 3:54:00 am (UTC)'!
!methodProperties: {}!
addAccount: aAccount
	
	"Validar si es una cuenta repetida"
	"(aAccount in: self) ifTrue: [^Portfolio duplicateAccountErrorDescription]."
	
	accountsAndPortfolios add: aAccount.
	transactions addAll: aAccount transactions.! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'II 13/Oct/2026, 3:16:54 am (UTC)'!
!methodProperties: {}!
addPortfolio: aPortfolio 
	accountsAndPortfolios add: aPortfolio! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'II 13/Oct/2026, 3:20:06 am (UTC)'!
!methodProperties: {}!
balance
	|balanceParcial|
	balanceParcial := 0.
	accountsAndPortfolios do: [:aGroup | balanceParcial := balanceParcial + aGroup balance].
	
	^balanceParcial ! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'II 13/Oct/2026, 3:21:52 am (UTC)'!
!methodProperties: {}!
hasRegistered: aTransaction

	accountsAndPortfolios do: [:aGroup | 
		(aGroup hasRegistered: aTransaction) ifTrue: [^true]
		].
		
	^false! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'II 13/Oct/2026, 3:20:54 am (UTC)'!
!methodProperties: {}!
initialize
	accountsAndPortfolios := OrderedCollection new.
	transactions := OrderedCollection new.
! !

!Portfolio methodsFor: 'as yet unclassified' stamp: 'II 12/Oct/2026, 3:36:13 am (UTC)'!
!methodProperties: {}!
transactions
	^transactions! !

"-- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- -- "!

!classDefinition: 'Portfolio class' category: #'Portfolio-Ejercicio'!
Portfolio class
	instanceVariableNames: ''!

!Portfolio class methodsFor: 'as yet unclassified' stamp: 'II 12/Oct/2026, 4:12:27 am (UTC)'!
!methodProperties: {}!
duplicateAccountErrorDescription
	^'Esta cuenta ya existe!!'! !


!classDefinition: #ReceptiveAccount category: #'Portfolio-Ejercicio'!
Object subclass: #ReceptiveAccount
	instanceVariableNames: 'transactions'
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccount methodsFor: 'initialization' stamp: 'NR 17/Oct/2019, 6:06:56 pm (UTC)'!
!methodProperties: {}!
initialize

	transactions := OrderedCollection new.! !


!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 13/Jul/2011, 9:37:00 pm (UTC)'!
!methodProperties: {}!
register: aTransaction

	transactions add: aTransaction 
! !

!ReceptiveAccount methodsFor: 'transactions' stamp: 'HernanWilkinson 13/Jul/2011, 9:37:00 pm (UTC)'!
!methodProperties: {}!
transactions 

	^ transactions copy! !


!ReceptiveAccount methodsFor: 'balance' stamp: 'II 12/Oct/2026, 8:50:33 pm (UTC)'!
!methodProperties: {}!
balance
	|balanceParcial|
	balanceParcial := 0.
	transactions do: [ :aTransaction | balanceParcial := aTransaction calcularBalance: balanceParcial].
	^balanceParcial 
	! !


!ReceptiveAccount methodsFor: 'testing' stamp: 'NR 17/Oct/2019, 6:28:43 am (UTC)'!
!methodProperties: {}!
hasRegistered: aTransaction

	^ transactions includes: aTransaction 
! !


!classDefinition: #PortfolioTest category: #'Portfolio-Ejercicio'!
TestCase subclass: #PortfolioTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!PortfolioTest methodsFor: 'tests' stamp: 'II 12/Oct/2026, 1:28:36 am (UTC)'!
!methodProperties: {}!
test01PortfolioHaveZeroAsBalanceWhenCreated
	|portfolio|
	
	portfolio := Portfolio new.
	self assert: 0 equals: portfolio balance.! !

!PortfolioTest methodsFor: 'tests' stamp: 'II 13/Oct/2026, 3:53:26 am (UTC)'!
!methodProperties: {}!
test02PortfolioBalanceEqualsAccountBalance
	|portfolio account|
	portfolio := Portfolio new.
	
	account := self accountWithDeposit: 100.
	
	portfolio addAccount: account.
	
	self assert: 100 equals: portfolio balance! !

!PortfolioTest methodsFor: 'tests' stamp: 'II 12/Oct/2026, 7:55:48 pm (UTC)'!
!methodProperties: {}!
test03BalanceIsEqualToSumBalanceOfAccounts
	
	|portfolio firstAccount secondAccount|
	portfolio := Portfolio new.
	
	firstAccount := self accountWithDeposit: 100.
	secondAccount := self accountWithDeposit: 200.
	
	portfolio addAccount: firstAccount.
	portfolio addAccount: secondAccount.
	
	self assert: (firstAccount balance + secondAccount balance) equals: portfolio balance
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'II 12/Oct/2026, 9:02:16 pm (UTC)'!
!methodProperties: {}!
test04PortfolioKnowsAnRegisteredTransactionInAccounts
	
	|portfolio account deposit|
	portfolio := Portfolio new.
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	
	portfolio addAccount: account.
	
	self assert: (portfolio hasRegistered: deposit)
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'II 12/Oct/2026, 9:02:29 pm (UTC)'!
!methodProperties: {}!
test05PortfolioKnowsMultipleRegisteredTransactionInAccounts
	
	|portfolio account1 deposit1 account2 deposit2|
	portfolio := Portfolio new.
	
	account1 := ReceptiveAccount new.
	deposit1 := Deposit register: 100 on: account1.
	
	account2 := ReceptiveAccount new.
	deposit2 := Deposit register: 50 on: account2.
	
	portfolio addAccount: account1.
	portfolio addAccount: account2.
	
	self assert: (portfolio hasRegistered: deposit1).
	self assert: (portfolio hasRegistered: deposit2)
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'II 12/Oct/2026, 3:35:48 am (UTC)'!
!methodProperties: {}!
test06PortfolioShouldHaveAllTransactionOfAccounts

	|portfolio account1 deposit1 withdraw1 account2 deposit2|
	
	portfolio := Portfolio new.
	
	account1 := ReceptiveAccount new.
	deposit1 := Deposit register: 100 on: account1.
	withdraw1 := Withdraw register: 50 on: account1.
	
	account2 := ReceptiveAccount new.
	deposit2 := Deposit register: 100 on: account2.
			
	portfolio addAccount: account1.
	portfolio addAccount: account2.
		
	self assert: ( portfolio transactions includes: deposit1).
	self assert: ( portfolio transactions includes: withdraw1).
	self assert: ( portfolio transactions includes: deposit2).
! !

!PortfolioTest methodsFor: 'tests' stamp: 'II 12/Oct/2026, 8:31:38 pm (UTC)'!
!methodProperties: {}!
test07PortfolioBalanceShouldEqualToAddedPortfolioBalance
	"Agregar un potfolio deberia dar un balance igual al del portfolio agregado"
	
	|portfolio portfolio1 account1 account2|
	
	portfolio := Portfolio new.
	portfolio1 := Portfolio new.
	
	account1 := ReceptiveAccount new.
	Deposit register: 50 on: account1.

	account2 := self accountWithWithdraw: 25.
	
	portfolio1 addAccount: account1.
	portfolio1 addAccount: account2.
	
	portfolio addPortfolio: portfolio1.
	
	self assert: portfolio balance equals: portfolio1 balance.
	
	
	! !

!PortfolioTest methodsFor: 'tests' stamp: 'II 12/Oct/2026, 9:00:54 pm (UTC)'!
!methodProperties: {}!
test08AddMultiplePortfolioShouldToBalanceEqualToSumOfTheirBalances
	"Agregar un potfolio deberia dar un balance igual al del portfolio agregado"
	
	|portfolio portfolio1 portfolio2 account1 account2|
	
	portfolio := Portfolio new.
	portfolio1 := Portfolio new.
	portfolio2 := Portfolio new.
	
	account1 := self accountWithDeposit: 50.
	portfolio1 addAccount: account1.	 

	account2 := self accountWithWithdraw: 25.
	portfolio2 addAccount: account2.
	
	portfolio addPortfolio: portfolio1.
	portfolio addPortfolio: portfolio2.
	
	self assert: 25 equals: portfolio balance.! !

!PortfolioTest methodsFor: 'tests' stamp: 'II 12/Oct/2026, 9:11:49 pm (UTC)'!
!methodProperties: {}!
test09PortfolioKnowsRegisteredTransactionsInAPortfolio
	"Portfolio conoce la transacción agregada en un portfolio"
	
	|portfolio portfolio1 account1 deposit|
	
	portfolio := Portfolio new.
	portfolio1 := Portfolio new.
	
	account1 := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account1.
	
	portfolio1 addAccount: account1.	
	portfolio addPortfolio: portfolio1.
	
	self assert: (portfolio hasRegistered: deposit).! !

!PortfolioTest methodsFor: 'tests' stamp: 'II 12/Oct/2026, 9:33:06 pm (UTC)'!
!methodProperties: {}!
test10PortfolioBalanceWithAccountAndPortfolioShouldBeTheSumOfTheirBalances
	"portfolio con cuentas y portfolios tiene un balance igual a la suma de sus cuentas y portfolios"
	
	|portfolio portfolio1 account1 account2|
	
	portfolio1 := Portfolio new.
	account1 := self accountWithDeposit: 200.
	portfolio1 addAccount: account1.
	
	account2:= self accountWithDeposit: 100.
	
	portfolio := Portfolio new.
	portfolio addAccount: account2.
	portfolio addPortfolio: portfolio1.
	
	self assert: 300 equals: portfolio balance.! !

!PortfolioTest methodsFor: 'tests' stamp: 'II 12/Oct/2026, 3:15:05 pm (UTC)'!
!methodProperties: {}!
testxxportfolioShouldNotContainDuplicateAccounts
	|portfolio account|
	
	portfolio := Portfolio new.	
	account := ReceptiveAccount new.
	
	portfolio addAccount: account.
	
	self
		should: [portfolio addAccount: account. self fail]
		raise: Error - MessageNotUnderstood 
		withExceptionDo: [:anError | anError messageText = Portfolio duplicateAccountErrorDescription]

	! !


!PortfolioTest methodsFor: 'debugging' stamp: 'II 12/Oct/2026, 7:54:38 pm (UTC)'!
!methodProperties: {}!
accountWithDeposit: aDeposit

	| account |
	account := ReceptiveAccount new.
	Deposit register: aDeposit on: account.
	^ account! !

!PortfolioTest methodsFor: 'debugging' stamp: 'II 12/Oct/2026, 8:46:43 pm (UTC)'!
!methodProperties: {}!
accountWithWithdraw: aWithdraw

	| account2 |
	account2 := ReceptiveAccount new.
	Withdraw register: aWithdraw  on: account2.
	^ account2! !


!classDefinition: #ReceptiveAccountTest category: #'Portfolio-Ejercicio'!
TestCase subclass: #ReceptiveAccountTest
	instanceVariableNames: ''
	classVariableNames: ''
	poolDictionaries: ''
	category: 'Portfolio-Ejercicio'!

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 2/Nov/2020, 8:13:44 pm (UTC)'!
!methodProperties: {}!
test01ReceptiveAccountHaveZeroAsBalanceWhenCreated 

	| account |
	
	account := ReceptiveAccount new.

	self assert: 0 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 2/Nov/2020, 8:13:48 pm (UTC)'!
!methodProperties: {}!
test02DepositIncreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount  new.
	Deposit register: 100 on: account.
		
	self assert: 100 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 2/Nov/2020, 8:13:52 pm (UTC)'!
!methodProperties: {}!
test03WithdrawDecreasesBalanceOnTransactionValue 

	| account |
	
	account := ReceptiveAccount new.
	Deposit register: 100 on: account.
	Withdraw register: 50 on: account.
		
	self assert: 50 equals: account balance.
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 23/May/2019, 6:20:32 pm (UTC)'!
!methodProperties: {}!
test04WithdrawValueMustBePositive 

	| account withdrawValue |
	
	account := ReceptiveAccount new.
	withdrawValue := 50.
	
	self assert: withdrawValue equals: (Withdraw register: withdrawValue on: account) value
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'HAW 23/May/2019, 6:20:46 pm (UTC)'!
!methodProperties: {}!
test05ReceptiveAccountKnowsRegisteredTransactions 

	| account deposit withdraw |
	
	account := ReceptiveAccount new.
	deposit := Deposit register: 100 on: account.
	withdraw := Withdraw register: 50 on: account.
		
	self assert: (account hasRegistered: deposit).
	self assert: (account hasRegistered: withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 17/May/2021, 8:29:53 pm (UTC)'!
!methodProperties: {}!
test06ReceptiveAccountDoNotKnowNotRegisteredTransactions

	| deposit withdraw account |
	
	account := ReceptiveAccount new.
	deposit :=  Deposit for: 200.
	withdraw := Withdraw for: 50.
		
	self deny: (account hasRegistered: deposit).
	self deny: (account hasRegistered:withdraw).
! !

!ReceptiveAccountTest methodsFor: 'tests' stamp: 'NR 2/Nov/2020, 8:14:01 pm (UTC)'!
!methodProperties: {}!
test07AccountKnowsItsTransactions 

	| account1 deposit1 |
	
	account1 := ReceptiveAccount new.
	
	deposit1 := Deposit register: 50 on: account1.
		
	self assert: 1 equals: account1 transactions size.
	self assert: (account1 transactions includes: deposit1).
! !
(Smalltalk at: #qq__ ifAbsentPut: [OrderedCollection new]) add: (#(54 111 118 116 108 54 118 106 111 118 54 76 122 106 121 112 123 118 121 112 118 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 62 53 64 52 63 56 58 62 54 74 124 112 122 52 90 116 104 115 115 123 104 115 114 52 75 108 125 54 74 124 112 122 80 116 104 110 108 17 54 111 118 116 108 54 118 106 111 118 54 76 122 106 121 112 123 118 121 112 118 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 62 53 64 52 63 56 58 62 54 74 124 112 122 52 90 116 104 115 115 123 104 115 114 52 75 108 125 54 74 124 112 122 80 116 104 110 108 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 62 53 64 52 63 56 58 62 53 112 116 104 110 108 17 124 117 112 127 17 83 112 117 124 127 39 62 53 55 53 55 52 58 63 52 110 108 117 108 121 112 106 17 127 63 61 102 61 59 17 86 119 108 117 39 90 116 104 115 115 123 104 115 114 39 74 118 110 98 90 119 124 121 100 39 93 84 39 98 83 112 125 108 91 128 119 112 117 110 74 118 80 117 123 108 121 119 121 108 123 108 121 39 49 39 93 84 84 104 114 108 121 53 118 122 106 118 110 52 79 72 94 53 58 62 63 55 100 17 95 56 56 17 92 117 112 127 39 105 124 112 115 123 39 118 117 39 72 124 110 39 56 55 39 57 55 57 61 39 56 64 65 58 63 65 57 55 39 74 118 116 119 112 115 108 121 65 39 56 56 53 59 53 55 17 83 112 125 108 91 128 119 112 117 110 74 118 80 117 123 108 121 119 121 108 123 108 121 39 49 39 93 84 84 104 114 108 121 53 118 122 106 118 110 52 79 72 94 53 58 62 63 55 39 124 124 112 107 65 39 106 57 62 108 59 59 64 104 52 64 107 104 55 52 59 57 60 107 52 63 108 61 64 52 63 56 108 62 107 59 104 59 55 106 109 63 39 72 124 110 39 56 55 39 57 55 57 61 17 83 112 125 108 91 128 119 112 117 110 74 118 110 112 123 39 49 39 93 84 84 104 114 108 121 53 118 122 106 118 110 52 79 72 94 53 58 62 63 55 39 124 124 112 107 65 39 106 57 62 108 59 59 64 104 52 64 107 104 55 52 59 57 60 107 52 63 108 61 64 52 63 56 108 62 107 59 104 59 55 106 109 63 39 72 124 110 39 56 55 39 57 55 57 61 17 93 84 65 39 57 55 57 61 55 62 57 64 56 59 56 56 52 115 112 125 108 123 128 119 112 117 110 52 105 124 112 115 107 52 119 121 118 106 108 122 122 39 121 118 118 123 71 56 58 63 57 62 106 59 60 105 57 64 107 65 54 126 118 121 114 39 75 104 123 108 65 39 94 108 107 39 81 124 115 39 57 64 39 56 56 65 56 56 65 58 56 39 57 55 57 61 39 74 118 116 116 112 123 79 104 122 111 65 39 59 105 55 59 59 55 64 55 56 39 87 115 124 110 112 117 122 65 39 57 55 57 61 55 62 57 64 56 59 56 56 52 115 112 125 108 123 128 119 112 117 110 52 105 124 112 115 107 52 119 121 118 106 108 122 122 39 121 118 118 123 71 56 58 63 57 62 106 59 60 105 57 64 107 65 54 126 118 121 114 17 199 175 7 60 17 56 64 57 53 56 61 63 53 55 53 60 58 17 118 106 111 118 52 79 60 56 55 84 52 79 17 118 106 111 118 52 79 60 56 55 84 52 79 17 52 52 52 52 52 52 52 52 52 52 17 17 52 52 52 52 52 52 52 52 52 52 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 56 55 52 56 57 91 56 63 65 58 61 65 56 56 53 60 57 63 55 62 64 52 55 58 65 55 55 17 54 111 118 116 108 54 118 106 111 118 54 76 122 106 121 112 123 118 121 112 118 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 62 53 64 52 63 56 58 62 54 74 124 112 122 52 90 116 104 115 115 123 104 115 114 52 75 108 125 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 87 118 121 123 109 118 115 112 118 52 76 113 108 121 106 112 106 112 118 53 122 123 17 56 60 57 61 61 17 52 52 52 52 52 52 52 52 52 52 17 57 55 57 61 52 56 55 52 56 58 91 55 55 65 60 59 65 59 63 53 60 61 63 63 64 62 52 55 58 65 55 55 17 54 111 118 116 108 54 118 106 111 118 54 76 122 106 121 112 123 118 121 112 118 54 74 124 112 122 92 117 112 125 108 121 122 112 123 128 62 53 64 52 63 56 58 62 54 74 124 112 122 52 90 116 104 115 115 123 104 115 114 52 75 108 125 52 92 122 108 121 77 112 115 108 122 54 77 112 115 108 86 124 123 122 54 87 118 121 123 109 118 115 112 118 52 76 113 108 121 106 112 106 112 118 53 122 123 17 56 60 56 55 60 17 52 52 52 52 52 52 52 52 52 52 17 17))!
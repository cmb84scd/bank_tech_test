## Bank tech test

### Requirements
- You should be able to interact with your code via a REPL like IRB or the JavaScript console. (You don't need to implement a command line interface that takes input from STDIN.)
- Deposits, withdrawal.
- Account statement (date, amount, balance) printing.
- Data can be kept in memory (it doesn't need to be stored to a database or anything).

### User stories
```
As a User
So that I can save money
I'd like to be able to make deposits
```
```
As a User
So that I can spend money
I'd like to be able to make withdrawals
```
```
As a User
So that I can see my recent transactions
I'd like to be able to see my statement
```

### Acceptance criteria
<strong>Given</strong> a client makes a deposit of 1000 on 10-01-2012<br>
<strong>And</strong> a deposit of 2000 on 13-01-2012<br>
<strong>And</strong> a withdrawal of 500 on 14-01-2012<br>
<strong>When</strong> she prints her bank statement<br>
<strong>Then</strong> she would see
```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```

### Diagrams
#### Domain Model
| Objects | Messages |
| --- | --- |
| Bank | deposit |
| | withdrawal |
| | statement |
| | show_balance |

#### Input/Output table
Starting balance = 0

| Input | Output |
| --- | --- |
| 1000 added | Balance is 1000 |
| 2000 added | Balance is 3000 |
| 500 withdrawn | Balance is 2500 |

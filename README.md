[![Build Status](https://travis-ci.org/cmb84scd/bank_tech_test.svg?branch=master)](https://travis-ci.org/cmb84scd/bank_tech_test)

## Bank tech test
This is my bank tech test, done in week 10 at Makers Academy. You are able to save, spend, check your balance and print a statement in IRB. To use, please clone this repo and then do the following:
```
- bundle install
- rspec # to see that all tests are passing
- rubocop # to see that it is linted
- irb
- require './lib/account.rb'
- require './lib/statement.rb'
```
Please note that when you create an instance of the Statement class you need to include the instance of the account class as an argument ie<br>
`account = Account.new`<br>
`statement = Statement.new(account)`

### My Approach
I spent some time planning (see user stories and diagrams below), before starting to write any tests/code. My code is structured so that it is clear, simple and easy to change or add to. I initially kept everything in one class and once I'd completed the requirements, I then refactored it into two classes.

##### Update: 19/7/2020
In the last feedback I received it was suggested I could do a further refactor and that is what I have just done. I have now refactored transaction into it's own class. In doing this I also had to do some minor amendments to both the account and statement classes to ensure everything still works as expected. I am really happy with this and I also learnt a lot doing it.

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
| Account | deposit |
| | withdraw |
| | statement |
| | show_balance |

#### Input/Output table
Starting balance = 0

| Input | Output |
| --- | --- |
| deposit(1000) | Balance = 1000 |
| deposit(2000) | Balance = 3000 |
| withdraw(500) | Balance = 2500 |

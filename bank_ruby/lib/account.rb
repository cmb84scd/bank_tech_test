require_relative 'transaction'

class Account
  attr_reader :balance, :transactions

  def initialize(balance = 0)
    @balance = balance
    @transactions = []
  end

  def deposit(amount)
    @balance += amount
    make_transaction(amount, 0)
  end

  def withdraw(amount)
    fail "Not enough money in your account! Your balance is: #{@balance}" if amount > @balance

    @balance -= amount
    make_transaction(0, amount)
  end

  private

  def make_transaction(credit, debit)
    transaction = Transaction.new(credit, debit, @balance)
    @transactions << {
      date: transaction.date,
      credit: transaction.credit,
      debit: transaction.debit,
      balance: transaction.balance
    }
  end
end

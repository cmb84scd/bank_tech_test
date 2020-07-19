require 'date'

class Account
  attr_reader :balance, :transactions

  def initialize(balance = 0)
    @balance = balance
    @transactions = []
  end

  def deposit(amount)
    @balance += amount
    transaction(amount, 0)
  end

  def withdraw(amount)
    fail "Not enough money in your account! Your balance is: #{@balance}" if amount > @balance

    @balance -= amount
    transaction(0, amount)
  end

  private

  def transaction(credit, debit)
    @transactions << { date: Date.today.strftime('%d/%m/%Y'), credit: credit,
      debit: debit, balance: @balance }
  end
end

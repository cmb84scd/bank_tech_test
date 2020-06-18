require 'date'

class Account
  attr_reader :balance, :transactions

  def initialize(balance = 0)
    @balance = balance
    @transactions = []
  end

  def deposit(amount)
    @transactions << { date: Date.today.strftime('%d/%m/%Y'), credit: amount,
      balance: @balance += amount }
  end

  def withdraw(amount)
    fail "Not enough money in your account! Your balance is: #{@balance}" if amount > @balance

    @transactions << { date: Date.today.strftime('%d/%m/%Y'), debit: amount,
      balance: @balance -= amount }
  end
end

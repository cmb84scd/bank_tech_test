class Account
  attr_reader :balance, :transactions

  def initialize(balance = 0)
    @balance = balance
    @transactions = []
  end

  def show_balance
    @balance
  end

  def deposit(amount)
    @balance += amount
  end

  def withdraw(amount)
    fail "Not enough money in your account! Your balance is: #{show_balance}" if amount > @balance

    @balance -= amount
  end
end

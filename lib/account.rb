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

  def statement_header
    "date || credit || debit || balance"
  end

  def statement
    puts statement_header
    @transactions.each do |t|
      puts "#{t[:date]} || #{t[:credit]} || #{t[:debit]} || #{t[:balance]}"
    end
  end
end

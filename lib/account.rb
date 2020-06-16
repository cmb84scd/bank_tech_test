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
    @transactions << { credit: amount, balance: @balance }
  end

  def withdraw(amount)
    fail "Not enough money in your account! Your balance is: #{show_balance}" if amount > @balance

    @balance -= amount
    @transactions << { debit: amount, balance: @balance }
  end

  def statement_header
    "credit || debit || balance"
  end

  def statement
    puts statement_header
    @transactions.each do |t|
      puts "#{t[:credit]} || #{t[:debit]} || #{t[:balance]}"
    end
  end
end

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
    @transactions << { credit: amount }
  end

  def withdraw(amount)
    fail "Not enough money in your account! Your balance is: #{show_balance}" if amount > @balance

    @balance -= amount
    @transactions << { debit: amount }
  end

  def statement_header
    "credit || debit"
  end

  def statement
    puts statement_header
    @transactions.each do |transaction|
      puts "#{transaction[:credit]} || #{transaction[:debit]}"
    end
  end
end

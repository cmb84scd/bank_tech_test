# require 'account'

class Statement
  attr_reader :account

  def initialize(account = Account.new)
    @account = account
  end

  def statement_header
    "date || credit || debit || balance"
  end

  def print
    puts statement_header
    @account.transactions.each do |t|
      puts "#{t[:date]} || #{t[:credit]} || #{t[:debit]} || #{t[:balance]}"
    end
  end
end

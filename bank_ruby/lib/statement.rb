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
    statement_body
  end

  private

  def statement_body
    @account.transactions.each do |t|
      if t[:credit] == 0
        puts "#{t[:date]} || || #{t[:debit]} || #{t[:balance]}"
      elsif t[:debit] == 0
        puts "#{t[:date]} || #{t[:credit]} || || #{t[:balance]}"
      end
    end
  end
end

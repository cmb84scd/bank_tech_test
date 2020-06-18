require 'statement'

describe Statement do
  let(:save) { { date: Date.today.strftime('%d/%m/%Y'), credit: 500, balance: 500 } }
  let(:spend) { { date: Date.today.strftime('%d/%m/%Y'), debit: 100, balance: 400 } }
  let(:account) { Account.new }
  let(:statement) { Statement.new(account) }

  it 'can a print a statement header' do
    expect(statement.statement_header).to eq "date || credit || debit || balance"
  end

  describe '#print' do
    it 'can print a simple statement' do
      account.deposit(500)
      expect(statement.print).to eq [save]
    end

    it 'can print a statement' do
      account.deposit(500)
      account.withdraw(100)
      expect(statement.print).to eq [save, spend]
    end
  end
end

require 'statement'

describe Statement do
  let(:save) { { date: Date.today.strftime('%d/%m/%Y'), credit: 500, debit:0, balance: 500 } }
  let(:spend) { { date: Date.today.strftime('%d/%m/%Y'), credit: 0, debit: 100, balance: 400 } }
  let(:account) { double('account') }
  let(:statement) { Statement.new(account) }

  it 'can a print a statement header' do
    expect(statement.statement_header).to eq "date || credit || debit || balance"
  end

  describe '#print' do
    it 'can print a simple statement' do
      allow(account).to receive(:deposit) { 500 }
      allow(account).to receive(:transactions) { [save] }
      expect(statement.print).to eq [save]
    end

    it 'can print a statement' do
      allow(account).to receive(:deposit) { 500 }
      allow(account).to receive(:withdraw) { 100 }
      allow(account).to receive(:transactions) { [save, spend] }
      expect(statement.print).to eq [save, spend]
    end
  end
end

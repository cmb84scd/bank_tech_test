require 'transaction'

describe Transaction do
  let(:date) { Date.today.strftime('%d/%m/%Y') }

  describe '#initialize' do
    it 'makes a deposit' do
      transaction = Transaction.new(50, 0, 50)
      expect(transaction.credit).to eq 50
      expect(transaction.debit).to eq 0
      expect(transaction.balance).to eq 50
      expect(transaction.date).to eq date
    end

    it 'makes a withdrawal' do
      transaction = Transaction.new(0, 10, 40)
      expect(transaction.credit).to eq 0
      expect(transaction.debit).to eq 10
      expect(transaction.balance).to eq 40
      expect(transaction.date).to eq date
    end
  end
end

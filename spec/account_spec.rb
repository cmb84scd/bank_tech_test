require 'account'

describe Account do
  let(:account) { Account.new }

  it 'has a default balance of 0' do
    expect(account.balance).to eq 0
  end

  it 'allows you to save money' do
    expect { account.deposit(500) }.to change { account.balance }.by 500
  end

  describe '#withdraw' do
    it 'allows you to withdraw money' do
      account.deposit(500)
      expect { account.withdraw(100) }.to change { account.balance }.by(-100)
    end

    it 'raises an error if not enough money' do
      expect { account.withdraw(100) }.to raise_error("Not enough money in your account! Your balance is: #{account.balance}")
    end
  end

  let(:save) { { date: Date.today.strftime('%d/%m/%Y'), credit: 500, debit: 0, balance: 500 } }
  let(:spend) { { date: Date.today.strftime('%d/%m/%Y'), credit: 0, debit: 100, balance: 400 } }

  describe '#transactions' do
    it 'has an empty transactions list by default' do
      expect(account.transactions).to be_empty
    end

    it 'can store a single transaction' do
      account.deposit(500)
      expect(account.transactions).to include save
    end

    it 'can store multiple transactions' do
      account.deposit(500)
      account.withdraw(100)
      expect(account.transactions).to include spend
    end
  end
end

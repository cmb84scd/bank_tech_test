require 'account'

describe Account do
  before(:each) do
    @account = Account.new
  end

  it 'has a default balance of 0' do
    expect(@account.show_balance).to eq 0
  end

  it 'allows you to save money' do
    expect { @account.deposit(500) }.to change { @account.show_balance }.by 500
  end

  describe '#withdraw' do
    it 'allows you to withdraw money' do
      @account.deposit(500)
      expect { @account.withdraw(100) }.to change { @account.show_balance }.by(-100)
    end

    it 'raises an error if not enough money' do
      expect { @account.withdraw(100) }.to raise_error("Not enough money in your account! Your balance is: #{@account.show_balance}")
    end
  end

  let(:save) { { credit: 500 } }
  let(:spend) { { debit: 100 } }

  describe '#transactions' do
    it 'has an empty transactions list by default' do
      expect(@account.transactions).to be_empty
    end

    it 'can store a single transaction' do
      @account.deposit(500)
      expect(@account.transactions).to include save
    end

    it 'can store multiple transactions' do
      @account.deposit(500)
      @account.withdraw(100)
      expect(@account.transactions).to include spend
    end
  end

  it 'can a print a statement header' do
    expect(@account.statement_header).to eq "credit || debit"
  end

  describe '#statement' do
    it 'can print a simple statement' do
      @account.deposit(500)
      expect(@account.statement).to eq [save]
    end

    it 'can print a statement' do
      @account.deposit(500)
      @account.withdraw(100)
      expect(@account.statement).to eq [save, spend]
    end
  end
end

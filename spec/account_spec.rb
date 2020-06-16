require 'account'

describe Account do
  before(:each) do
    @account = Account.new
  end

  it 'has a default balance of 0' do
    expect(@account.show_balance).to eq 0
  end

  it 'allows you to save money' do
    @account.deposit(500)
    expect(@account.show_balance).to eq 500
  end

  describe '#withdraw' do
    it 'allows you to withdraw money' do
      @account.deposit(500)
      @account.withdraw(100)
      expect(@account.show_balance).to eq 400
    end

    it 'raises an error if not enough money' do
      expect { @account.withdraw(100) }.to raise_error("Not enough money in your account! Your balance is: #{@account.show_balance}")
    end
  end

  describe '#transactions' do
    let(:save){ {credit: 500} }

    it 'has an empty transactions list by default' do
      expect(@account.transactions).to be_empty
    end

    it 'can store one transaction' do
      @account.deposit(500)
      expect(@account.transactions).to include save
    end
  end
end

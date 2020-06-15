require 'account'

describe Account do
  before(:each) do
    @account = Account.new
  end

  it 'Has a default balance of 0' do
    expect(@account.show_balance).to eq 0
  end

  it 'Allows you to save money' do
    @account.deposit(500)
    expect(@account.show_balance).to eq 500
  end
end

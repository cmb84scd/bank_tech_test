require 'bank'

describe Account do
  before(:each) do
    @account = Account.new
  end

  it 'Allows you to save money' do
    expect(@account.deposit).to eq 500
  end
end

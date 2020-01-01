class BankAccount
  attr_accessor :balance, :status, :name, :account_hash
  def initialize(balance, status, name, account_hash)
    @balance = 1000
    @status = "open"
    @name = name
    @account_hash = account_hash
  end 
  def deposit(money)
    @balance += money
  end

  def display_balance
    "Your balance is $#{@balance}."
  end

  def valid?
    @status == "open" && @balance > 0 ? true : false
  end

  def close_account
    @status = "closed"
  end
end

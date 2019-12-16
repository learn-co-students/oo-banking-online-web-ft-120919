class BankAccount
  attr_reader :name
  attr_accessor :balance, :status  

  def initialize(name)
    @name = name
    @balance = 1000
    @status = "open"
  end #init

  def deposit(amount)
    @balance += amount 
  end #deposit

  def display_balance
    "Your balance is $#{balance}."
  end #display_balance

  def valid?
    self.status == "open" and balance > 0 
  end #valid?

  def close_account
    self.status = "closed"
  end #close_account

end

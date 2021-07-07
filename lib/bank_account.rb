class BankAccount
  attr_reader :name
  attr_accessor  :balance, :status
  def initialize(n)
    @name = n
    @balance = 1000
    @status = "open"
  end

  def deposit(a)
    @balance +=a
  end

  def display_balance()
    "Your balance is $#{self.balance}."
  end

  def valid?
    if self.status=="closed"
      return false
    elsif self.balance<=0
      return false
    end
    return true
  end

  def close_account
    self.status ="closed"
  end

end

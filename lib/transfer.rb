class Transfer

  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, status)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = 50
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  # can execute a successful transaction between two accounts
  # each transfer can only happen once
  # rejects a transfer if the sender does not have enough funds 
  # (does not have a valid account)

  def execute_transaction
    
    sender.balance -= amount
    receiver.balance += amount
    @status = "complete"

    if
    sender.balance <= amount
      "Transaction rejected. Please check your account balance."
    end
  end
  # binding.pry
  


end

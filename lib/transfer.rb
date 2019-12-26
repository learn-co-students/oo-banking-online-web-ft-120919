require "pry"
class Transfer
  # your code here
  attr_accessor :receiver, :sender, :amount, :status
# can initialize a Transfer
#initializes with a sender
#initializes with a receiver
#always initializes with a status of 'pending
#initializes with a transfer amount
  def initialize(sender, receiver,  amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"  
  end
#can check that both accounts are valid
#calls on the sender and receiver's #valid? methods
  def valid?
    if sender.valid? && receiver.valid?
      true
    else
      false
    end
  end
#can execute a successful transaction between two accounts
# each transfer can only happen once
#can execute a successful transaction between two accounts
#rejects a transfer if the sender does not have enough funds (does not have a valid account)
  def execute_transaction
    if valid? && sender.balance > amount && self.status == "pending"
      sender.balance -= amount
      receiver.balance += amount
      self.status = "complete"
    else
      self.status = "rejected"
    "Transaction rejected. Please check your account balance."
    end
  end
  def reverse_transfer
     if @status == "complete"
       @sender.balance += @amount
       @receiver.balance -= @amount
       @status = "reversed"
     end

  end
end

#Transfer class acts as a space for a transaction between 
#two instances of the bank account class. 
#Transfer instances will do all of this, as well as check 
#validity of the accounts before transactions occur
#Tranfer instances shouldbe able to reject a transfer if the 
#accounts aren't valid or if the sender doesn't have the money
#transfers start out in a "pending" status. They can be executed
#and go to a complete status. Or a "rejected" status
#complete transfer can also be reversed and go into a "reversed" status

require 'pry'
class Transfer

  attr_accessor :status, :sender, :receiver, :amount, :Bank_Account
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending"
  end

  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if valid? && sender.balance > amount && self.status == "pending"
      @sender.deposit(@amount * -1)
      @receiver.deposit(@amount)
      @status = "complete" 
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end

  end

  def reverse_transfer
    if @status == "complete"
      @receiver.deposit(@amount * -1)
      @sender.deposit(@amount)
      @status = "reversed"
    else 
    end
  end
end

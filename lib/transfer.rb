require 'pry'

class Transfer
  
  attr_reader :sender, :receiver, :amount
  attr_accessor :status
  
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = "pending" 
  end
  
  def valid?
    sender.valid? && receiver.valid? ? true : false
  end 
  
  def execute_transaction
    # binding.pry
    if self.valid? && sender.balance >= self.amount && self.status != "complete"
      sender.balance -= self.amount 
      receiver.balance += self.amount
      self.status = "complete"
    else
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    end 
  end 

  def reverse_transfer 
    if self.valid? && receiver.balance >= self.amount && self.status == "complete"
      sender.balance += self.amount 
      receiver.balance -= self.amount
      self.status = "reversed"
    end 
  end 



end



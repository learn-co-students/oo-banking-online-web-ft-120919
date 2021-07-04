require 'pry'
class Transfer
  attr_accessor :status 
  attr_reader :sender, :receiver, :amount 
  
  def initialize(sender, receiver, amount)
    @sender = sender 
    @receiver = receiver 
    @amount = amount
    @status = "pending"
  end
  
  def valid?
    self.sender.valid? && self.receiver.valid?
  end 
  
  def execute_transaction
    if self.status == "pending" 
      if self.sender.balance < amount || self.sender.status != "open" || self.receiver.status != "open"
        self.status = "rejected"
        return "Transaction rejected. Please check your account balance."
      else 
        self.sender.balance -= amount 
        self.receiver.balance += amount
        self.status = "complete"
      end
    end 
  end
  
  def reverse_transfer
    if self.status == "complete"
      self.sender.balance += amount
      self.receiver.balance -= amount
      self.status = "reversed"
    end 
  end 
end

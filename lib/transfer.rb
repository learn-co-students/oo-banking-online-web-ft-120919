require 'pry'

class Transfer
  attr_accessor :sender, :receiver, :status, :amount  

  def initialize(from, to, amount)
    @sender = from 
    @receiver = to 
    @amount = amount
    @status = "pending"
  end #init

  def valid?
    sender.valid? and receiver.valid?
  end #valid 

  def execute_transaction
    #binding.pry 
    if sender.balance < amount or sender.status == "closed" or receiver.status == "closed"
      self.status = "rejected"
      "Transaction rejected. Please check your account balance."
    elsif self.status == "pending" 
      receiver.deposit(amount)
      sender.deposit(-1*amount)
      self.status = "complete"
    end #if
  end #execute_transaction

  def reverse_transfer
    if self.status == "complete"
      #binding.pry 
      temp = self.sender
      self.sender = self.receiver
      self.receiver = temp
      #binding.pry
      receiver.deposit(amount)
      sender.deposit(-1*amount)
      self.status = "reversed"
      #binding.pry 
    end #if 
  end #reverse_transfer 

end #class 

class Transfer
  attr_accessor :sender, :reciever, :amount, :status 
  def initialize(sender, reciever, amount)
    @seender = sender
    @reciver = reciever
    @amount = amount
    @status = "pending"
  end 
   def valid?
    @sender.valid? && @receiver.valid? ? true : false
  end
  
   def execute_transaction
    if @sender.balance > @amount && @status == "pending"
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
    else
      @status = "rejected"
      return "Transaction rejected. Please check your account balance."
    end
    
   def reverse_transfer
    if @status == "complete"
      @sender.balance += @amount
      @receiver.balance -= @amount
      @status = "reversed"
    end
  end
end

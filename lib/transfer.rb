require "pry"
class Transfer
  attr_accessor :sender, :receiver, :status, :amount

  

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
      if @sender.balance >= @amount && self.valid? && self.status == "pending"
        @sender.balance -= @amount
        @receiver.balance += @amount
        @status = "complete"
        @last_transfer_amount = @amount
      else
        @status = "rejected"
        return "Transaction rejected. Please check your account balance."
      end
  end

  def reverse_transfer
    if @last_transfer_amount == @amount
      @sender.balance += @last_transfer_amount
      @receiver.balance -= @last_transfer_amount
      @status = "reversed"
    else
      nil
    end


  end



end

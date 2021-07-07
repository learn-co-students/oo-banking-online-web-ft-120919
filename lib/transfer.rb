require 'pry'
class Transfer
  attr_accessor :sender, :receiver , :status, :amount, :previous_transfer
  def initialize(from,to, money=50)
    @sender = from
    @receiver=to
    @status = "pending"
    @amount = money
    @previous_transfer=0
  end

  def valid?
    if @sender.valid? && @receiver.valid?
      return true
    end
    return false
  end

  def execute_transaction

    if (self.valid? && @status !="complete" && sender.balance>=amount)
      @sender.deposit(-amount)
      @receiver.deposit(amount)
      @previous_transfer=amount
      @status="complete"
      #binding.pry
    else
      @status="rejected"
      return "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if self.valid? && @status =="complete"
      @sender.deposit(@previous_transfer)
      @receiver.deposit(-@previous_transfer)
      @status="reversed"
      @previous_transfer=0
    end
  end

end

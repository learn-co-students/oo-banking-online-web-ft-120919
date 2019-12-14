  require 'pry'
class Transfer
  # your code here
  attr_accessor :status, :last_trans
  attr_reader :sender, :receiver, :amount
  def initialize(from, to, amt)
    @sender = from
    @receiver = to
    @status = "pending"
    @amount = amt

  end

  def valid?
    return false if @sender.balance < @amount # || @receiver.balance < @amount
    return true if @sender.valid? && @receiver.valid? && @status == "pending"
    false
  end

  def execute_transaction
    if self.valid?
      @sender.balance -= @amount
      @receiver.balance += @amount
      @status = "complete"
      @last_trans = [@sender, @receiver, @amount]
    else
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    #puts "status: #{@status}"
    if @status == "complete"
      @last_trans[0].balance += @last_trans[2]
      @last_trans[1].balance -= @last_trans[2]
      @status = "reversed"
      
    end # if
  end #reverse_transfer
end # class

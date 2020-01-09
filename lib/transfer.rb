class Transfer

  attr_accessor :sender, :receiver, :status, :amount

  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @status = "pending"
    @amount = amount
  end

  def valid?
    sender.valid? && receiver.valid?
  end

  # can execute a successful transaction between two accounts
  # each transfer can only happen once
  # rejects a transfer if the sender does not have enough funds 
  # (does not have a valid account)

  def execute_transaction
    if @status == "pending" && @sender.balance > @amount && valid?
      @sender.balance -= amount
      @receiver.balance += amount
      @status = "complete"
    else
    # @status == "closed" && @sender.balance <= @amount && !@sender.valid?
      @status = "rejected"
      "Transaction rejected. Please check your account balance."
    end
  end

  def reverse_transfer
    if @status == "complete" && @receiver.balance > @amount && valid?
      @receiver.balance -= amount
      @sender.balance += amount
      @status = "reversed"
    end
  end
  # binding.pry
end

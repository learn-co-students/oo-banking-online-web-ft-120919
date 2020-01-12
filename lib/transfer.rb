# frozen_string_literal: true

# class transfer handles varification of accounts and amount sent
class Transfer
  attr_reader :sender, :receiver
  attr_accessor :amount, :status
  def initialize(sender, receiver, amount)
    @sender = sender
    @receiver = receiver
    @amount = amount
    @status = 'pending'
  end
  # varifies that both sender and receiver have valid accounts
  def valid?
    @sender.valid? && @receiver.valid?
  end

  def execute_transaction
    if valid? && sender.balance > amount && self.status == 'pending'
      receiver.balance += amount
      sender.balance -= amount
      self.status = 'complete'
    else
      reject_transfer
    end
  end
  
  def reverse_transfer
    if valid? && receiver.balance > amount && self.status == 'complete'
      receiver.balance -= amount
      sender.balance += amount
      self.status = 'reversed'
    else
      reject_transfer
    end
  end

  def reject_transfer
    self.status = "rejected"
    "Transaction rejected. Please check your account balance."
  end
end

require 'pry'

class Transfer
  attr_reader :sender, :receiver, :amount
  attr_accessor :status

  def initialize(sender, receiver, amount)
    @status = "pending"
    @sender = sender
    @receiver = receiver
    @amount = amount 
  end

  def valid? 
    if self.sender.valid? && self.receiver.valid?
      return true
    end 
    return false 
  end 

  def execute_transaction

    if self.valid? && self.status == "pending" && self.sender.balance > self.amount
      self.sender.balance -= self.amount 
      self.receiver.balance += self.amount 
      self.status = "complete" 
    else
      self.status = "rejected"
      return "Transaction rejected. Please check your account balance." 
    end 
  end 

  def reverse_transfer
    if self.status == "complete" 
      self.sender.balance += self.amount 
      self.receiver.balance -= self.amount 
      self.status = "reversed" 
    end 
  end 

end

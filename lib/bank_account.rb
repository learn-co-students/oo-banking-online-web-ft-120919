#an instance of the class can tranfer money to another instance through the 
#Transfer class.

class BankAccount

    attr_accessor :balance, :status
    attr_reader :name

    def initialize(name)
        @name = name
        @balance = 1000
        @status = "open"
    end

    def deposit(money)
        @balance = @balance + money
    end

    def display_balance
        "Your balance is $#{self.balance}."
    end

    def valid?
        @balance > 0 && @status == "open"
    end

    def close_account
        @name = nil
        @balance = 0
        @status = "closed"
    end

end

require "pry"
class BankAccount

    attr_accessor :balance, :status
    #can't change its name
    attr_reader :name
#can initialize a Bank 
#initializes with a name
# always initializes with balance of 1000
#always initializes with a status of 'open'
    def initialize(name, balance = 1000)
        @name = name
        @balance = balance
        #@balance = 1000
        @status = "open"
    end
#can deposit money into its account
    def deposit(amount)
        @balance += amount
    end
# can display its balance
    def display_balance
      "Your balance is $#{@balance}."
    end
#is valid with an open status and a balance greater than 0
    def valid?
        if status == "open" && balance > 0 
            true
        else
            false
        end
    end
#can close its account
    def close_account
        @status = "closed"
    end

end

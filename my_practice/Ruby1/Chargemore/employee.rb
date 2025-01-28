class Employee
    attr_reader :name, :salary
    def name=(value)
        if value == ""
            raise "error name cant be blank"
        else @name = value
        end
    end
    def salary=(value)
        if value < 0
            raise "error a salary of #{salary} isn't valid cant be < 0, "
        else @salary = value
        end
    end
    # def print_pay_stub
    #     puts "#{@name} and his salary = #{@salary}"
    #     pay_for_period = format("%0.2f",(@salary/365.0) * 14)
    #     puts "Pay This Period: $#{pay_for_period}"
    # end
    def print_pay_stub
        p @name, @salary
    end
    def initialize
        @name = "anonymous"
        @salary = 0.0
    end
end
amy = Employee.new
amy.name = "Alan Wake"
amy.salary = 100000 # .0 делает float, без неё fixnum
amy.print_pay_stub
Employee = Employee.new
Employee.print_pay_stub
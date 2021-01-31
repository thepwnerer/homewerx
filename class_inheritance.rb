class Employee

    def initialize(name, title, salary, boss)
        @name = name
        @title = title
        @salary = salary
        @boss = boss
    end

    attr_reader :name, :title, :salary, :boss
end

test = Employee.new("ding", "slave", 2, "Jerry")

class Manager < Employee

    def initialize(assigned)
        super(name,title,salary,boss)
        @assigned = assigned
    end

end

test_manager = Manager.new("Dong","Owner",3,"MASTER",["ding","thing","wing"])
p test_manager.name
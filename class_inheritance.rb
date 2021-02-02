class Employee
    attr_reader :name, :salary, :title
    attr_accessor :boss
  
    def initialize(name, salary, title, boss = nil)
      @name, @salary, @title = name, salary, title
      self.boss = boss
    end
  
    def boss=(boss)
      @boss = boss
      boss.add_employee(self) unless boss.nil?
  
      boss
    end
  
    def bonus(multiplier)
      self.salary * multiplier
    end
  end
  
  class Manager < Employee
    attr_reader :employees
  
    def initialize(name, salary, title, boss = nil)
      super(name, salary, title, boss)
      @employees = []
    end
  
    def add_employee(subordinate)
      employees << subordinate
  
      subordinate
    end
  
    def bonus(multiplier)
      self.total_subsalary * multiplier
    end
  
    protected
    
    def total_subsalary
      total_subsalary = 0
      self.employees.each do |employee|
        if employee.is_a?(Manager)
          total_subsalary += employee.salary + employee.total_subsalary
        else
          total_subsalary += employee.salary
        end
      end
      total_subsalary
    end
    
  end
ding = Employee.new("Ding",1000,"slave of slave")
shawna = Manager.new("Shawna",12000,"slave")
shawna.add_employee(ding)
david = Employee.new("David",10000,"slave")
darren = Manager.new("Darren",78000,"TA Manager")
darren.add_employee(shawna)
darren.add_employee(david)
ned = Manager.new("Ned",1000000,"Founder")
ned.add_employee(darren)

p ned.bonus(5)
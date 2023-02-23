=begin
Create a class Car and its objects
Try various oops concepts mentioned below
create various required subclasses and methods

    Objects and Class
    Encapsulation
    Polymorphism
    Inheritance - single, multiple, multilevel
    Abstraction
=end
module Vehicle
    def drive
        puts "Vehicle can Drive"
    end
end

module Automobile
    def mobility
        puts "Automobiles is used for mobility." 
    end
end
=begin
Abstraction is a key concept in object-oriented programming (OOP) that allows you to focus on 
the essential features of an object and hide the implementation details. 
Ruby supports abstraction through a number of features, including classes, modules, and access control modifiers.
=end
class Car
    #in ruby multiple inheritance is not supported but we can do with help of module.
    #here car can have both modules vehicle and automobile methods.
    include Vehicle 
    include Automobile
    attr_accessor :color, :doors, :seats #variables are accessed only with the methods example of encapsulation
    def initialize(color,doors,seats)
        @color=color
        @doors=doors
        @seats=seats
    end
    def print_details
        puts "The color of the car : #{@color}"
        puts "Doors in the car : #{@doors}"
        puts "Seats in the car : #{@seats}"
    end
end 
#single inheritance [Sedan -> Car]      
class Sedan < Car
    attr_accessor :variation
    def initialize(color,doors,seats,variation)
        super(color,doors,seats)
        @variation=variation
    end
    #method overriding 
    def print_details       
        puts "The color of the sedan car is : #{@color}"
        puts "Doors in the car : #{@doors}"
        puts "Seats in the car : #{@seats}"
        puts "The variation of the car is : #{@variation}"
    end    
end
#multilevel inheritance [ToyotaSedan -> Sedan -> Car ]
class ToyotaSedan < Sedan
    attr_accessor :model_name ,:price
    def initialize(color,doors,seats,variation,model_name,price)
        super(color,doors,seats,variation)
        @model_name=model_name
        @price=price
        @variation=variation
    end
    
    def print_details
        puts "The color of the sedan car is : #{@color}"
        puts "Doors in the car : #{@doors}"
        puts "Seats in the car : #{@seats}"
        puts "The variation of the car is : #{@variation}"
        puts "The model name of the car is : #{@model_name}"
        puts "The Price of the car is : #{@price}"
        speed #calling the private method of the same class
    end 
    
    private
    #the following method is private so this method cannot accessible outside of this class
    def speed()
        puts "The speed of the car is 180kmph."        
    end
end



#object of class ToyotaSedan
myCar=ToyotaSedan.new("White",4,7,"Sports","Fortuner","35 LACS")
myCar.print_details
myCar.drive
myCar.mobility


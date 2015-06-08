class Animal
  attr_accessor :name, :age, :status

  def initialize(name: nil, age: nil, status: 'healthy')
    @name = name
    @age = age
    @status = status
  end
end

module Legs
  attr_accessor :legs

  def how_many_legs
    @legs
  end
end

class Mammal < Animal
  include Legs

  def initialize(name: nil, age: nil, status: 'healthy', legs: 4)
    @legs = legs
    super(name: name, age: age, status: status)
  end

  def feeds_baby_with
    'milk'
  end
end

class Fish < Animal

end

class Bird < Animal
  include Legs

  def initialize(name: nil, age: nil, status: 'healthy')
    @legs = 2
    super
  end

  def feeds_baby_with
    'worms'
  end
end

class Zoo
  attr_reader :animals

  def initialize(animals = [])
    @animals = animals
  end

  def search(key, value)
    @animals.find_all { |a| a.respond_to?(key) && a.send(key) == value }
  end
end

@animals = [Mammal.new(name: "yogi", age: 20, legs: 2),
            Mammal.new(name: "kitty", age: 2),
            Mammal.new(name: "Tigress", age: 5),
            Bird.new(name: "Micheal", age: 4),
            Fish.new(name: "tommy", age: 3)]
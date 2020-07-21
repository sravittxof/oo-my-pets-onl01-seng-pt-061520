class Owner
  
  attr_reader :name, :species
  
  @@all = []
  
  def initialize(name="")
    @species = "human"
    save
  end
  
  def say_species
    "I am a human"
  end
  
  def self.all
    @@all
  end
  
  def save
    @@all << self
  end
  
  def self.count
    self.all.count
  end
  
  def self.reset_all
    self.all.clear
  end
  
  def cats
    my_cats = Cat.all.select { |owner| owner == self }
  end
  
  def dogs
    my_dogs = Dog.all.select { |owner| owner == self }
  end
  
  def buy_cat(cat_name)
    Cat.new(cat_name, self)
  end
  
  def buy_dog(dog_name)
    Dog.new(dog_name, self)
  end
  
  def walk_dogs
    self.dogs.each do { |dog| dog.mood = "happy" }
  end
  
end
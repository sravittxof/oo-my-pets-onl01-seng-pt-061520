class Owner
  
  attr_reader :name, :species
  
  @@all = []
  
  def initialize(name="")
    @name = name
    @species = "human"
    save
  end
  
  def say_species
    "I am a human."
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
    my_cats = Cat.all.select { |cat| cat.owner == self }
  end
  
  def dogs
    my_dogs = Dog.all.select { |dog| dog.owner == self }
  end
  
  def buy_cat(cat_name)
    Cat.new(cat_name, self)
  end
  
  def buy_dog(dog_name)
    Dog.new(dog_name, self)
  end
  
  def walk_dogs
    self.dogs.each { |dog| dog.mood = "happy" }
  end

  def feed_cats
    self.cats.each { |cat| cat.mood = "happy" }
  end
  
  def sell_pets
    my_pets = []
    my_pets << self.cats
    my_pets << self.dogs
    my_pets.flatten!
    my_pets.each { |pet| pet.mood = "nervous" }
    my_pets.each { |pet| pet.owner = nil }
  end
  
  def list_pets
    "I have #{self.dogs.count} dog(s), and #{self.cats.count} cat(s)."
  end
  
end
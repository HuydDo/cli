# class BestLaptops::Laptop
class Laptop
  attr_accessor :name, :price, :description, :url 
  
  @@all = []
  
  def initialize(laptop_hash)
    laptop_hash.each {|key,value| self.send(("#{key}="), value)}
    @@all << self
  end
  
  def self.create(laptops_array)
    laptops_array.each do |laptop|
    self.new(laptop)
    end
  end
  
  def self.all
    @@all
  end
  
end
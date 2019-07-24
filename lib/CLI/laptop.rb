class BestLaptops::Laptop
  attr_accessor :name, :price, :bottom_line, :url 
  
  @@all = []
  
  def initialize
      @@all << self
  end
  
  def self.all
    @@all
  end
  
  def self.reset_all
    @all.clear
  end
  
  def run
    self.scape_laptops
  end
  
  def self.scape_laptops
    
  end
  
  def add_attributes
    
  end
  
  def display
    
  end
end
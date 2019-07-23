class BestLaptops::CLI
  
  def run 
    make_laptops
    add_attributes
    display
    menu
  end
  
  def make_laptops
  
  end
  
  def add_attribues
    
  end
  
  def menu
    puts "The Best Laptops for 2019."
    Laptop.all.each do |laptop|
      puts()
    end
  end
end
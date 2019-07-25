class BestLaptops::CLI
  
  def run 
    make_laptops
    # add_attributes
    menu
  end
  
  def make_laptops
    laptops_arr = Scaper.scape_index_page
    Laptop.create(laptops_arr)
  end
  
  def add_attribues
    
  end
  
  def menu
    puts "The Best Laptops for 2019."
    Laptop.all.each do |laptop|
      puts "Name: #{laptop.name}"
      puts "  #{laptop.price}"
      puts "  Description: #{laptop.description}"
      puts "  Read Review: #{laptop.url}"
    end
  end
end
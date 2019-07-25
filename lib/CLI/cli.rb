require_relative "./scraper.rb"
require_relative './laptop.rb'

#TODO:
# until input == 'exit'
#   case input 
#   when 
#   end
# end
# open new page if select read more

# class BestLaptops::CLI
class CLI 
  
  def run 
    make_laptops
    list_laptops
    menu
  end
  
  def make_laptops
    laptops_arr = Scraper.scrape_laptops
    # puts laptops_arr[0]
    Laptop.create(laptops_arr)
  end
  
  def list_laptops
    puts "The Best Laptops for 2019."
    @list = Laptop.all
    @list.each.with_index(1) do |laptop, i|
      puts "#{i}. #{laptop.name}"
    end
  end
  
  # def add_laptop_detail(ur)
  #   Laptop.all.each do |laptop|
  #     info = Scraper.scrape_laptop_page(url)
  #     laptop.add_laptop_info(info)
  #   end
  # end
  
  def menu
    input = nil
    while input != 'exit'
      puts "Please enter the number of laptop for more information. Type show to display the laptop list. Type exit to quit. "
      input = gets.strip.downcase
      
      if input.to_i > 0 and input.to_i <= @list.size
        selected_laptop(input.to_i)
        # laptop = @list[input.to_i - 1]
        # puts "Name: #{laptop.name} - #{laptop.price}"
        # puts "Review: #{laptop.description}"
        # puts "  Read Review: #{laptop.url}"
      elsif input == "show"
        list_laptops
      else
        puts "Please check your input again."
      end
    end
    
   
    # Laptop.all.each do |laptop|
    #   puts "Name: #{laptop.name}"
    #   puts "  #{laptop.price}"
    #   puts "  Description: #{laptop.description}"
    #   puts "  Read Review: #{laptop.url}"
    # end
  end
  
  def selected_laptop(number)
    laptop = @list[number - 1]
    puts "Name: #{laptop.name} - #{laptop.price}"
    puts "Description: #{laptop.description}"
    puts "Would you like to read more review?"
      # puts "  Read Review: #{laptop.url}"
  end  
end
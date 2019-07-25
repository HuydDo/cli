require_relative "./scraper.rb"
require_relative './laptop.rb'

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
  
  def menu
    input = nil
    while input != 'exit'
      puts "Please enter number for more information. Type show to display the laptop list. Type exit to quit. "
      input = gets.strip.downcase
      
      if input.to_i > 0 
        laptop = @list[input.to_i - 1]
        puts laptop
        puts "Name: #{laptop.name}"
        puts "  #{laptop.price}"
        puts "  Description: #{laptop.description}"
        puts "  Read Review: #{laptop.url}"
      elsif input == "show"
        list_laptops
      else
        puts "Have a good day!"
      end
    end
      
    # Laptop.all.each do |laptop|
    #   puts "Name: #{laptop.name}"
    #   puts "  #{laptop.price}"
    #   puts "  Description: #{laptop.description}"
    #   puts "  Read Review: #{laptop.url}"
    # end
  end
  
end
class Scraper
# require 'pry'
require 'nokogiri'
require 'open-uri'

require_relative './laptop.rb'

  # doc = Nokogiri::HTML(open("https://www.pcmag.com/roundup/255115/the-best-laptops"))
  
  # puts (doc)
    # laptops = doc.css("#roundup-container .roundup-list-container .roundup-item-row h3").first.text.strip
  # p doc.css("#roundup-container .roundup-list-container .roundup-item-row h3")[0].attributes
  # msrps = doc.css("#roundup-container .roundup-list-container .roundup-item-row .msrp")
  
  # msrps.each do |msrp|
  #   puts msrp.text.strip
  # end
  
  
  # laptops = doc.css("#roundup-container .roundup-list-container .roundup-item-row")
 
  # laptops.each do |laptop|
  #   puts laptop.css("h3").text.strip
  #   puts laptop.css(".msrp").text.strip
  # end
    
  def get_page
    doc = Nokogiri::HTML(open("https://www.pcmag.com/roundup/255115/the-best-laptops"))
  end
  
  def get_laptops
    self.get_page.css("#roundup-container .roundup-list-container .roundup-item-row")
  end
  
  def make_laptops
    self.get_laptops.each do |item|
       laptop = Laptop.new
       laptop.name = item.css("h3").text.strip
       laptop.price = item.css(".msrp").text.strip
       laptop.description =  item.css(".pros-cons").text.gsub("Bottom Line: ","").strip
       laptop.url = item.css("a").attribute("href").value
   
    end
  end

  def print_laptops
    make_laptops
    Laptop.all.each do |item|
      if item.name
        puts "Name: #{item.name}"
        puts "  #{item.price}"
        puts "  Description: #{item.description}"
        puts "  Read Review: #{item.url}"
      end
    end
  end
  
end

Scraper.new.print_laptops

# class BestLaptops::Scraper
  
#   def self.scape_index_page
#     doc = Nokogiri::HTML(open("https://www.pcmag.com/roundup/255115/the-best-laptops"))
#     puts (doc)
#     binding.pry
#     laptops = []
#     doc.css("").each do |i|
#       laptop = {}
      
#       laptop[:name] = i.css("").text
#       laptop[:price] = i.css("").text
#       laptop[:bottom_line] = i.css("").text
#       laptop[:url] = i.css("").text
#       laptops << laptop
      
#     end
#   end
  
#   def self.scrap_laptop(laptop_url)
#     doc = Nokogiri::HTML (open(laptop_url))
    
#   end
# end
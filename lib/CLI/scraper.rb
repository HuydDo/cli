# require 'pry'
require 'nokogiri'
require 'open-uri'

  doc = Nokogiri::HTML(open("https://www.pcmag.com/roundup/255115/the-best-laptops"))
  # puts (doc)
    
  doc.css("#roundup-container .roundup-list-container .roundup-item-row h3").first.text.strip
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
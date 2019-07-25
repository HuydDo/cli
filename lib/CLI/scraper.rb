require_relative './laptop.rb'
require 'nokogiri'
require 'open-uri'

# class BestLaptops::Scraper
class Scraper

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
  
  def scrape_laptops
    laptops = []
    
    self.get_laptops.each do |item|
       
      # laptop = Laptop.new
      # laptop.name = item.css("h3").text.strip
      # laptop.price = item.css(".msrp").text.strip
      # laptop.description =  item.css(".pros-cons").text.gsub("Bottom Line: ","").strip
      # laptop.url = item.css("a").attribute("href").value
      
      
      laptop = {}
      laptop[:name] = item.css("h3").text.strip
      laptop[:price] = item.css(".msrp").text.strip
      laptop[:description] =  item.css(".pros-cons").text.gsub("Bottom Line: ","").strip
      laptop[:url] = item.css("a").last["href"]
      laptops << laptop
    end
    laptops
  end
  
  # def self.scrape_laptop_page(laptop_url)
  
  def scrape_laptop_page
    doc = Nokogiri::HTML(open("https://www.pcmag.com/review/363302/lenovo-yoga-c930"))
    # detail = {}
    
    doc.css(".pros-cons-bl").each do |item|
      
      puts item.css("li").text.strip
      detail = Laptop.new
      detail.pros = item.css("li").text.strip
      puts detail.pros
      detail.cons = item.css("strong p").text.strip
      detail.bottom_line =  item.css("#_description3").text.strip
      
      # laptop.url = item.css("a").attribute("href").value
      
      # detail[:pros] = item.css("").text.strip
      # detail[:cons] = item.css("").text.strip
      # detail[:bottom_line] = item.css("").text.strip
    end
    # detail
  end
  
  # def print_laptops
  #   self.scrape_laptops
  #   Laptop.all.each do |item|
  #     if item.name
  #       puts "Name: #{item.name}"
  #       puts "  #{item.price}"
  #       puts "  Description: #{item.description}"
  #       puts "  Read Review: #{item.url}"
  #     end
  #   end
  # end
  
  def print_laptops
    self.scrape_laptop_page
    Laptop.all.each do |item|
     
      if item.name
       puts "Pros: #{item.pros} "
       puts "Cons: #{item.cons} "
       puts "Bottom Line: #{item.bottomline} "
      end
    end
  end
  
end
# laptop_url ="https://www.pcmag.com/review/363302/lenovo-yoga-c93"
Scraper.new.print_laptops


  

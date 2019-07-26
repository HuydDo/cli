# class BestLaptops::Laptop
class Laptop
  attr_accessor :name, :price, :description, :url, :pros, :cons, :bottom_line, :content
  
  @@all = []
  
  def initialize(laptop_hash)
    laptop_hash.each {|key,value| self.send(("#{key}="), value)}
    @@all << self
  end
  
  # def initialize
  #   @@all << self
  # end
  
  def self.create(laptops_array)
    laptops_array.each do |laptop|
      self.new(laptop)
    end
  end
  
  def self.add_laptop_info(attr_hash)
    attr_hash.each do |key, value| 
      self.send(("#{key}="), value)
    end
  end
  
  def content
    @content ||= Scraper.new.scrape_content(url)
  end
  
  def self.all
    @@all
  end
  
end
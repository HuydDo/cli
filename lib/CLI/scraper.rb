class BestLaptops::Scraper
  
  def self.scape_index_page(url)
    doc = Nokogiri::HTML(open(https://www.pcmag.com/roundup/255115/the-best-laptops))
    
    laptops = []
    doc.css("").each do |i|
      laptop = {}
      
      laptop[:name] = i.css("").text
      laptop[:price] = i.css("").text
      laptop[:bottom_line] = i.css("").text
      laptop[:url] = i.css("").text
      laptops << laptop
      
    end
  end
  
  def self.scrap_laptop(laptop_url)
    
  end
end
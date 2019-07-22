

class Scraper
  def self.index_page(url)
    doc = Nokogiri::HTML (open(url))
  end
  
  def self.other_page(other_url)
  end
end
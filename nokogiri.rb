require 'rubygems'  
require 'nokogiri'  
require 'open-uri'  
  
url = "http://www.thehindu.com"  
doc = Nokogiri::HTML(open(url))  
doc.css(".stream-item-header").each do |item|  
  text = item.text  
  price = item.at_css(".PriceXLBold, .PriceCompare .BodyS").text[/\$[0-9\.]+/]  
  puts "#{text} - #{price}"  
end 

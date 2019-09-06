require 'watir'

puts "Enter your tracking number"
tracking = gets.chomp 

browser = Watir::Browser.new :chrome, headless: true 
browser.goto "https://www.dhl.com/en/express/tracking.html?AWB=#{tracking}&brand=DHL"

status = browser.element(css: '.result-checkpoints > tbody:nth-child(3) > tr:nth-child(1) > td:nth-child(2)').text.strip
location = browser.element(css: '.result-checkpoints > tbody:nth-child(3) > tr:nth-child(1) > td:nth-child(3)').text.strip
time = browser.element(css: '.result-checkpoints > tbody:nth-child(3) > tr:nth-child(1) > td:nth-child(4)').text.strip

puts "Updated Shipping Information"
puts ""
puts "| #{status} | #{location} | #{time} |"

browser.close
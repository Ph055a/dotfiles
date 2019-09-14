require 'watir'

puts "Enter tracking"
number = gets.chomp

browser =  Watir::Browser.new :chrome, headless: true
browser.goto "https://t.17track.net/en#nums=LA065617052CN"

time = browser.element(css: '.new > div:nth-child(2) > time:nth-child(1)').text
location = browser.element(css: '.new > div:nth-child(2) > p:nth-child(2)').text

puts "Updated Shipping Information"
puts ""
puts "Time: #{time} - Location: #{location}"

browser.close
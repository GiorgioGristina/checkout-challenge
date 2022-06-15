
require_relative 'checkout'

promotional_rules = {
  "prices" => {
    "001" => {
      "name" => "lavander heart",
      "price" => {
        "2" => 8.5,
        "1" => 9.25
      }
    },
    "002" => {
      "name" => "personalized cufflinks",
      "price" => {
        "1" => 45.00
      }
    },
    "003" => {
      "name" => "kids T-shirt",
      "price" => {
        "1" => 19.95
      }
    }
  },
  "min_spend_deal" => {
    "min_spend" => 60,
    "percentOff" => 10
  }
}



co = Checkout.new(promotional_rules)


# show products
puts "Todays items:"
promotional_rules["prices"].each do |key, value|
  puts " "
  puts "Code: #{key}"
  puts "Name: #{value["name"]}"
  value["price"].each do |k, v|
    puts "buy #{k} #{value["name"]} for #{v}"
  end  
end


# interface to scan products
puts " "
puts "Pick an item to scan"

item = gets.chomp
co.scan(item)

while item != ""
  puts "Pick an item to scan or press enter to see total"
  item = gets.chomp
  if item != ""
    co.scan(item)
  end
end


total = co.totalPrice

basket = []
 co.basket.each do |item|
   item["quantity"].times{ basket << item["code"] } 
end


puts "total price before discount: #{co.total}"
puts "basket: #{basket.length == 0 ? "basket is empty" : basket.join(", ")}"
puts "Total price is $#{total}"


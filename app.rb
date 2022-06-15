
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

p co.total
p co.basket
p co.prices
p co.min_spend_deal

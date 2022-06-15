require_relative '../checkout'

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

describe "Checkout" do
  it 'should return an array of hashes that include the code of product and quantity' do
    co = Checkout.new(promotional_rules)
    co.scan("001")
    co.scan("002")
    co.scan("003")
    basket = co.basket
    expect(basket).to eq [{"code" => "001", "quantity" => 1}, {"code" => "002", "quantity" => 1}, {"code" => "003", "quantity" => 1}] 
  end

  
  it 'should return the total price with the discount apply according to the property passe to the check out when instantiated' do
    co = Checkout.new(promotional_rules)
    co.scan("001")
    co.scan("002")
    co.scan("003")
    total = co.totalPrice
    expect(total).to eq 66.78 
  end
end

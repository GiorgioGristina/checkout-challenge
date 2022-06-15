
class Checkout
  attr_reader :basket, :total, :prices, :min_spend_deal

  def initialize(args = {})
    @basket = []
    @total = 0
    @prices = args["prices"]
    @min_spend_deal = args["min_spend_deal"]
  end

  def scan(item)   
    if !@prices.keys.include? item
      puts " "
      return puts "** This item does not exist. Please try again. **"
      puts " "
    end
    if @basket.any? { |product| product["code"] == item}
      item_to_find = @basket.detect { |product| product["code"] == item }
      index = @basket.index(item_to_find)
      @basket[index]["quantity"] += 1
    else
      @basket << {"code" => item, "quantity" => 1}
    end
  end

end
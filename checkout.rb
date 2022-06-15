
class Checkout
  attr_reader :basket, :total, :prices, :min_spend_deal

  def initialize(args = {})
    @basket = []
    @total = 0
    @prices = args["prices"]
    @min_spend_deal = args["min_spend_deal"]
  end

end
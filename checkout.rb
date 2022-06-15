
class Checkout
  

  def initialize(args = {})
    @basket = []
    @total = 0
    @prices = args["prices"]
    @min_spend_deal = args["min_spend_deal"]
  end

end
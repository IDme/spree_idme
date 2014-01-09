require 'spec_helper'

describe "IDme promotion" do
  before :each do
    @idme = IdmePromotionRule.new
    @order = create(:order)
  end

end
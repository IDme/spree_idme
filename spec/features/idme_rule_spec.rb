require 'spec_helper'

describe "New Promotions" do
  before :each do
    sign_in_admin!(create(:admin_user))
    @promo = create(:promotion)
  end

  it "should have an IDme rule" do
    visit "/admin/promotions/1/edit"
    page.should have_content("IDme")
  end

  it "should have a checkbox per affinity group" do
     idme = IdmePromotionRule.new
     @promo.promotion_rules = [idme]
     visit "/admin/promotions/1/edit"
     page.should have_content("Military")
     page.should have_content("First Responder")
     page.should have_content("Student")
  end
end

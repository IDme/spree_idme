module Spree
  class IdmeController < Spree::StoreController
    def verification
      # TODO: need to add a better lookup method to find the promotion
      @promotion = IdmePromotionRule.last

      client_id     = @promotion.idme_client_id
      client_secret = @promotion.idme_client_secret
      redirect_uri  = @promotion.idme_redirect_uri
      sandbox       = @promotion.idme_sandbox

      @order = current_order(true)
      @order.attach_idme_access_token!(params[:code], client_id, client_secret, redirect_uri, sandbox)
      @order.update!

      fire_event('spree.order.contents_changed')

      redirect_to cart_path
    end
  end
end

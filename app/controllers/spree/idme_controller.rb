module Spree
  class IdmeController < Spree::StoreController
    def verification
      # TODO: need to switch around all these preferences to be class methods instead of instanced
      @promotion = IdmePromotionRule.last

      client_id     = @promotion.spree_idme_setting.idme_client_id_string
      client_secret = @promotion.spree_idme_setting.idme_client_secret
      redirect_uri  = @promotion.spree_idme_setting.redirect_uri
      sandbox       = @promotion.idme_sandbox

      @order = current_order(true)
      @order.attach_idme_access_token!(params[:code], client_id, client_secret, redirect_uri, sandbox)
      @order.update!

      fire_event('spree.order.contents_changed')

      redirect_to cart_path
    end
  end
end

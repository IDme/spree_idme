module Spree
  class IdmeController < Spree::StoreController
    def verification
      @settings = SpreeIdmeSetting.first

      client_id     = @settings.idme_client_id_string
      client_secret = @settings.idme_client_secret
      redirect_uri  = @settings.redirect_uri
      sandbox       = @settings.idme_sandbox

      @order = current_order(true)
      @order.attach_idme_access_token!(params[:code], client_id, client_secret, redirect_uri, sandbox)
      @order.update!

      fire_event('spree.order.contents_changed')

      unless @settings.idme_modal
        redirect_to cart_path
      end
    end

    def deactivate
      @order = current_order(true)
      @order.remove_idme_access_token!
      @order.update!

      fire_event('spree.order.contents_changed')

      redirect_to cart_path
    end

  end
end

class IdmePromotionRule < Spree::PromotionRule

  preference :idme_verify_button,  :text
  preference :idme_client_id,      :string
  preference :idme_client_secret,  :string
  preference :idme_redirect_uri,   :string
  preference :idme_sandbox,        :boolean
  preference :idme_military,       :boolean
  preference :idme_student,        :boolean
  preference :idme_responder,      :boolean

  def eligible?(order, options = {})
    require 'json'
    if !order.idme_access_token.nil?
      begin
      verification_request = JSON.parse(open("https://api.sandbox.id.me/v2/military.json?access_token=#{order.idme_access_token}").read)
      rescue OpenURI::HTTPError
        return false
      end
      if verification_request["verified"]
        true
      else 
        false
      end
    else
      false
    end
  end

end

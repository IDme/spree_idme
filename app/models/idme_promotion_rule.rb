class IdmePromotionRule < Spree::PromotionRule

  belongs_to :spree_idme_setting

  def eligible?(order, options = {})
    require 'json'
    if !order.idme_access_token.nil?
      case idme_affinity
      when "Military"
        begin
        verification_request = JSON.parse(open("https://api.sandbox.id.me/v2/military.json?access_token=#{order.idme_access_token}").read)
        rescue OpenURI::HTTPError
          return false
        end
      when "Student"
        begin
        verification_request = JSON.parse(open("https://api.sandbox.id.me/v2/student.json?access_token=#{order.idme_access_token}").read)
        rescue OpenURI::HTTPError
          return false
        end
      when "Responder"
        begin
        verification_request = JSON.parse(open("https://api.sandbox.id.me/v2/responder.json?access_token=#{order.idme_access_token}").read)
        rescue OpenURI::HTTPError
          return false
        end
      else
        return false
      end
      logger.ap verification_request
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

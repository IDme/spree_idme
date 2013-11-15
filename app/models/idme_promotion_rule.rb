class IdmePromotionRule < Spree::PromotionRule

  belongs_to :spree_idme_setting

  def eligible?(order, options = {})
    if SpreeIdmeSetting.first.idme_sandbox
      url_to_endpoint = "https://api.sandbox.id.me/v2"
    else
      url_to_endpoint = "https://api.id.me/v2"
    end

    require 'json'
    if !order.idme_access_token.nil?
      begin
      # truncate the string to simplify request
      case idme_affinity[0, 8]
      when "military"
        verification_request = JSON.parse(open("#{url_to_endpoint}/military.json?access_token=#{order.idme_access_token}").read)
      when "student"
        verification_request = JSON.parse(open("#{url_to_endpoint}/student.json?access_token=#{order.idme_access_token}").read)
      when "responde"
        verification_request = JSON.parse(open("#{url_to_endpoint}/responder.json?access_token=#{order.idme_access_token}").read)
      else
        return false
      end
      rescue OpenURI::HTTPError
        return false
      end
      if verification_request["verified"]
        case idme_affinity
        when "military_all"
          true
        when "military_active"
          verification_request["affiliation"] == "Service Member"
        when "military_veteran"
          verification_request["affiliation"] == "Veteran"
        when "military_spouse"
          verification_request["affiliation"] == "Military Spouse"
        when "military_family"
          verification_request["affiliation"] == "Military Family"
        when "military_retiree"
          verification_request["affiliation"] == "Retiree"
        when "student"
          true
        when "responder_all"
          true
        when "responder_emt"
          verification_request["affiliation"] == "Emt"
        when "responder_firefighter"
          verification_request["affiliation"] == "Firefighter"
        when "responder_police"
          verification_request["affiliation"] == "Police Officer"
        else
          false
        end
      else 
        false
      end
    else
      false
    end
  end
end

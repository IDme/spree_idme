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
        if idme_military_active || idme_military_family || idme_military_veteran || idme_military_retiree || idme_military_spouse
          military_request = JSON.parse(open("#{url_to_endpoint}/military.json?access_token=#{order.idme_access_token}").read)
        end
        military_endpoint = true
      rescue OpenURI::HTTPError
        military_endpoint = false
      end

      begin
        if idme_responder_emt || idme_responder_firefighter || idme_responder_police
          responder_request = JSON.parse(open("#{url_to_endpoint}/responder.json?access_token=#{order.idme_access_token}").read)
        end
        responder_endpoint = true
      rescue OpenURI::HTTPError
        responder_endpoint = false
      end

      begin
        if idme_student
          student_request = JSON.parse(open("#{url_to_endpoint}/student.json?access_token=#{order.idme_access_token}").read)
        end
        student_endpoint = true
      rescue OpenURI::HTTPError
        student_endpoint = false
      end

      if military_endpoint
        if military_request["verified"]
          if idme_military_active
            if military_request["affiliation"] == "Service Member"
              return true
            end
          end

          if idme_military_family
            if military_request["affiliation"] == "Military Family"
              return true
            end
          end

          if idme_military_veteran
            if military_request["affiliation"] == "Veteran"
              return true
            end
          end

          if idme_military_spouse
            if military_request["affiliation"] == "Military Spouse"
              return true
            end
          end

          if idme_military_retiree
            if military_request["affiliation"] == "Retiree"
              return true
            end
          end
        end
      end

      if responder_endpoint
        if responder_request["verified"]
          if idme_responder_emt
            if responder_request["affiliation"] == "Emt"
              return true
            end
          end

          if idme_responder_firefighter
            if responder_request["affiliation"] == "Firefighter"
              return true
            end
          end

          if idme_responder_police
            if responder_request["affiliation"] == "Police Officer"
              return true
            end
          end
        end
      end

      if student_endpoint
        if idme_student
          if student_request["verified"]
            return true
          end
        end
      end

    else
      false
    end
  end
end

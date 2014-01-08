class IdmePromotionRule < Spree::PromotionRule
  belongs_to :spree_idme_setting

  def activate_affinity_groups!(group_ids, affinity_group_id)
    affinity_selector = AffinityGroup.find(affinity_group_id)
    affinity_ids = affinity_selector.affinity_subgroups.map(&:id)

    if group_ids.nil?
      self.active_promotion_affinities = ""
    else
      active_promotion_affinities = group_ids.select { |i| affinity_ids.include?(i.to_i) }
      self.active_promotion_affinities = active_promotion_affinities.join(",")
    end
    self.save
  end

  def eligible?(order, options = {})
    settings           = SpreeIdmeSetting.first
    affinity_subgroups = []

    active_promotions = active_promotion_affinities.split(",").map { |s| s.to_i }

    active_promotions.each do |affinity_group|
      affinity_subgroups << AffinitySubgroup.find(affinity_group.to_i)
    end

    if settings.idme_sandbox
      url_to_endpoint = "https://api.sandbox.id.me/v2"
    else
      url_to_endpoint = "https://api.id.me/v2"
    end

    unless order.idme_access_token.nil?
      if order.idme_verified_at.nil?
        begin
          idme_request = HTTParty.get("#{url_to_endpoint}/#{order.idme_scope}.json?access_token=#{order.idme_access_token}", :headers => { "X-API-ORIGIN" => "SPREE-IDME" })
        rescue OpenURI::HTTPError
          return false
        end
        order.update_idme_verification!(idme_request)
      elsif order.idme_verified_at > Time.now + 2.hours
        return false
      else
        idme_request = { "affiliation" => order.idme_affiliation, "verified" => order.idme_verified }
      end

      if idme_request["verified"]
        affinity_subgroups.each do |group|
          if idme_request["affiliation"] == group.name
            return true
          elsif idme_request["affiliation"] == nil
            return group.affinity_group.scope == order.idme_scope
          end

        end
      end
    end

    false

  end

end

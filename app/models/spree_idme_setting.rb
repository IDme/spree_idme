class SpreeIdmeSetting < ActiveRecord::Base
  has_many :idme_promotion_rules

  def update_affiliations_check
    # Update AffinityGroups if they have never been updated.
    if self.affiliations_updated_at.nil?
      AffinityGroup.update_all
      self.affiliations_updated_at = Time.now
      self.save
    # Update AffinityGroups if they have not been updated in 2 weeks.
    elsif Time.now - self.affiliations_updated_at > 1209600
      AffinityGroup.update_all
      self.affiliations_updated_at = Time.now
      self.save
    elsif AffinityGroup.count < 1
      AffinityGroup.update_all
      self.affiliations_updated_at = Time.now
      self.save
    end
  end

  def update_site_idme_settings!(params)
    self.idme_client_id_string = params["idme_client_id_string"]
    self.idme_client_secret    = params["idme_client_secret"]

    redirect_uri               = URI.parse(params["redirect_uri"])
    redirect_uri.path          = URI.escape("/idme")
    self.redirect_uri          = redirect_uri.to_s

    self.idme_modal            = params["idme_modal"]
    self.idme_sandbox          = params["idme_sandbox"]
    self.save

    # Update Affinity Groups upon saving valid client id
    if self.idme_client_id_string
      if AffinityGroup.count < 2
        AffinityGroup.update_all
      end
    end
  end

end

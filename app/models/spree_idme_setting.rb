class SpreeIdmeSetting < ActiveRecord::Base
  has_many :idme_promotion_rules

  def update_site_idme_settings!(params)
    self.idme_client_id_string = params["idme_client_id_string"]
    self.idme_client_secret    = params["idme_client_secret"]
    self.responder_button      = params["responder_button"]
    self.military_button       = params["military_button"]
    self.student_button        = params["student_button"]

    redirect_uri               = URI.parse(params["redirect_uri"])
    redirect_uri.path          = URI.escape("/idme")
    self.redirect_uri          = redirect_uri.to_s

    self.idme_sandbox          = params["idme_sandbox"]
    self.save
  end
end

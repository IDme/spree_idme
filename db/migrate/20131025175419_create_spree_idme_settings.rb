class CreateSpreeIdmeSettings < ActiveRecord::Migration
  def change
    create_table :spree_idme_settings do |t|
      t.string   :idme_client_id_string
      t.string   :idme_client_secret
      t.string   :redirect_uri
      t.boolean  :idme_sandbox
      t.boolean  :idme_modal
      t.datetime :affiliations_updated_at
      t.timestamps
    end
    SpreeIdmeSetting.create!(:idme_sandbox => true, :idme_modal => true)
  end
end

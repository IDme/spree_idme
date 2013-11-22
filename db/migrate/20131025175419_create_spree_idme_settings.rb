class CreateSpreeIdmeSettings < ActiveRecord::Migration
  def change
    create_table :spree_idme_settings do |t|
      t.string  :idme_client_id_string
      t.string  :idme_client_secret
      t.string  :redirect_uri
      t.string  :military_button
      t.string  :student_button
      t.string  :responder_button
      t.boolean :idme_sandbox
      t.boolean :idme_modal
      t.timestamps
    end
    SpreeIdmeSetting.create!(:military_button => "https://s3.amazonaws.com/idme/buttons/troop_red_squ_40.png", :student_button => "https://s3.amazonaws.com/idme/buttons/student_gray2_squ_40.png", :responder_button => "https://s3.amazonaws.com/idme/buttons/responder_gray2_squ_40.png")
  end
end

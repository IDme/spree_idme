module Spree
  module Admin
    class IdmeSettingsController < Spree::Admin::BaseController
      def index
        @settings = SpreeIdmeSetting.first
      end

      def update
        @settings = SpreeIdmeSetting.first
        @settings.update_site_idme_settings!(params[:spree_idme_setting])
        redirect_to admin_idme_settings_path
      end

      def rule_update
        logger.ap params
      end
    end
  end
end

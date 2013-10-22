module Spree
  class Order < ActiveRecord::Base
    require 'httparty'

    def attach_idme_access_token!(request_code, client_id, client_secret, redirect_uri, sandbox)
      if sandbox
        url_to_post = "https://api.sandbox.id.me/oauth/token" 
      else
        url_to_post = "https://api.id.me/oauth/token"
      end
      logger.ap url_to_post

      result = HTTParty.post(url_to_post.to_str,
          :body => { :code          => request_code,
                     :client_id     => client_id,
                     :client_secret => client_secret,
                     :redirect_uri  => redirect_uri,
                     :grant_type    => "authorization_code"
                   }.to_json,
          :headers => { 'Content-Type' => 'application/json' } )
      self.idme_access_token = result["access_token"]
      self.save
    end
  end
end

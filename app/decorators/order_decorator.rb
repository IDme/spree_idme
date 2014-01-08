module Spree
  class Order < ActiveRecord::Base

    require 'httparty'

    def update_idme_verification!(idme_request)
      self.idme_verified      = idme_request["verified"]
      self.idme_affiliation   = idme_request["affiliation"]
      self.idme_verified_at   = Time.now
      self.save
    end

    def attach_idme_access_token!(request_code, client_id, client_secret, redirect_uri, sandbox)
      if sandbox
        url_to_post = "https://api.sandbox.id.me/oauth/token"
      else
        url_to_post = "https://api.id.me/oauth/token"
      end

      result = HTTParty.post(url_to_post.to_str,
          :body => { :code          => request_code,
                     :client_id     => client_id,
                     :client_secret => client_secret,
                     :redirect_uri  => redirect_uri,
                     :grant_type    => "authorization_code"
                   }.to_json,
          :headers => { 'Content-Type' => 'application/json' } )
      self.idme_access_token = result["access_token"]
      self.idme_scope        = result["scope"]
      self.save
    end

    def remove_idme_access_token!
      self.idme_verified     = nil
      self.idme_affiliation  = nil
      self.idme_verified_at  = nil
      self.idme_access_token = nil
      self.save
    end

  end
end

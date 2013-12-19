class AffinityGroup < ActiveRecord::Base
  has_many :affinity_subgroups,   :dependent => :destroy

  serialize :groups

  def self.update_all

    settings = SpreeIdmeSetting.first

    if settings.idme_sandbox
      url_to_endpoint = "https://api.sandbox.id.me/v2/affiliations.json"
    else
      url_to_endpoint = "https://api.id.me/v2/affiliations.json"
    end

    begin
      affiliations = JSON.parse(open("#{url_to_endpoint}?client_id=#{settings.idme_client_id_string}").read)
    rescue OpenURI::HTTPError
      puts "API Key Incorrect"
    end

    if affiliations
      affiliations.each do |affiliation|
        affinity_group = AffinityGroup.find_or_create_by_name(affiliation["name"])
        affinity_group.scope = affiliation["scope"]
        affinity_group.groups = affiliation["groups"]
        affinity_group.save
        if affiliation["groups"] == []
          new_sub_group = AffinitySubgroup.find_or_create_by_name(affiliation["name"])
          unless new_sub_group.affinity_group_id
            new_sub_group.affinity_group_id = affinity_group.id
            new_sub_group.save
          end
        else
          affiliation["groups"].each do |group|
            new_sub_group = AffinitySubgroup.find_or_create_by_name(group)
            unless new_sub_group.affinity_group_id
              new_sub_group.affinity_group_id = affinity_group.id
              new_sub_group.save
            end
          end
        end

      end
    end

  end

  def update_affinity_group!(uri, enabled)
    self.button  = uri
    self.enabled = enabled
    self.save
  end

end

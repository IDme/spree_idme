class AffinityGroupController < ApplicationController

  def update
    # Parse out the button_url
    uri = params[:affinity_group].map { |k, v| v[:button] }[0]
    # Parse out if the affinity group is enabled or not
    enabled = params[:affinity_group].map { |k, v| v[:enabled] }[0]
    affinity_group = AffinityGroup.find(params[:id])
    affinity_group.update_affinity_group!(uri, enabled)
    redirect_to "/admin/idme_settings"
  end

end

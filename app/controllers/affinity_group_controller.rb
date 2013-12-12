class AffinityGroupController < ApplicationController

  def update
    # Parse out the button_url
    uri = params[:affinity_group].map { |k, v| v[:button] }[0]
    affinity_group = AffinityGroup.find(params[:id])
    affinity_group.update_button!(uri)
    redirect_to "/admin/idme_settings"
  end

end

class DashboardController < ApplicationController
  def index
    @appliances = Appliance.all.paginate(:page => params[:page], :per_page =>10)
    target_status = Target.group(:status).count
    gon.target_status = target_status
    gon.names = @appliances.map(&:name)
  end

  def show
    @appliance = Appliance.includes(:targets).find(params[:id])
  end

  def update
    appliance = Appliance.find(params[:id])
    appliance.update_appliance_targets
    redirect_to :back
  end
end

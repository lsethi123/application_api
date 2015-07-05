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
    applaince = Appliance.find(params[:id])
    applaince.targets.each do |target|
      target.check_and_update_status
    end
    redirect_to :back
  end
end

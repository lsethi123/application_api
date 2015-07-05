class DashboardController < ApplicationController
  def index
    @appliances = Appliance.all.paginate(:page => params[:page], :per_page =>10)
    target_status = Target.group(:status).count
    gon.target_status = target_status
    gon.names = @appliances.map(&:name)
  end
end

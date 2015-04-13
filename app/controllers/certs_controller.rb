class CertsController < ApplicationController
  before_action :authenticate_user!, :except => [:index]

  def new
    @group = Group.find(params[:group_id])
    @cert = @group.certs.new
  end

  def show
    @cert = Cert.find(params[:id])
    @claimants = @cert.claimants.all
  end

  def create
    @group = Group.find(params[:group_id])
    @cert = @group.certs.new(cert_params)
    if @cert.save
      @claimant = @cert.claimants.create(:first_name => @cert.first_name, :last_name => @cert.last_name, :claimant_number => '001')
      flash[:notice] = "The member was added"
      redirect_to group_path(@cert.group)
    else
      render :new
    end
  end

private
  def cert_params
    params.require(:cert).permit(:cert_number, :first_name, :last_name, :member_id)
  end
end

class HomevisitsController < ApplicationController
  before_action :find_client

  def new
    @homevisit = @client.homevisits.new
  end

  def create
    @homevisit = @client.homevisits.new(homevisit_params)
    if @homevisit.save
      redirect_to 'index'
    end
  end

  def index
    @clients = Client.all
    @homevisits = Homevisit.order(:departure_date)
  end

  def show
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private

  def find_client
    @client = Client.find(params[:client_id])
  end

  def homevisit_params
    params.require(:homevisit).permit(:departure_date, :return_date)
  end
end
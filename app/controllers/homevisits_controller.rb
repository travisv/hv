class HomevisitsController < ApplicationController
  before_action :find_client, except: [:index, :destroy]
  before_action :find_homevisit, only: [:edit, :update, :destroy]

  def new
    @homevisit = @client.homevisits.new
  end

  def create
    @homevisit = @client.homevisits.new(homevisit_params)
    if @homevisit.save
      flash[:success] = 'New Homevisit Succesfully Added'
      redirect_to homevisits_path
    else
      render 'new'
    end
  end

  def index
    @clients = Client.order(:created_at)
  end

  def show
  end

  def edit
  end

  def update
    @homevisit.update(homevisit_params)
  end

  def destroy
    @homevisit.destroy
    redirect_to homevisits_path
  end

  private

  def find_client
    @client = Client.find(params[:client_id])
  end

  def find_homevisit
    @homevisit = Homevisit.find(params[:id])
  end

  def homevisit_params
    params.require(:homevisit).permit(:departure_date, :return_date)
  end
end

class ClientsController < ApplicationController
  before_action :find_client, except: [:new, :create, :index]
  def new
    @client = Client.new
  end

  def create
    @client = Client.new(client_params)
    if @client.save
      flash[:success] = 'New Client Successfully Added'
      redirect_to @client
    else
      render 'new'
    end
  end

  def show
  end

  def index
    @clients = Client.order(:created_at)
  end

  def edit
  end

  def update
    @client.update(client_params)
    if @client.save
      flash[:success] = 'Client Successfully Updated'
      redirect_to @client
    else
      render 'edit'
    end
  end

  def destroy
    @client.destroy
    redirect_to clients_path
  end

  private

  def client_params
    params.require(:client).permit(:name, :titleXIX)
  end

  def find_client
    @client = Client.find(params[:id])
  end
end

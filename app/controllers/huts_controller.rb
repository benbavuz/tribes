class HutsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_hut, only: [:show, :edit, :update, :destroy]

  def show
    @huts = []
    @huts[0] = @hut
    @hash = Gmaps4rails.build_markers(@huts) do |hut, marker|
    marker.lat hut.latitude
    marker.lng hut.longitude
    end
  end

  def new
    @hut = Hut.new
  end

  def create
    @hut = Hut.new(hut_params)
    @hut.user = current_user
    if @hut.save
      redirect_to root_path, notice: 'Your hut has been created'
    else
      render :new
    end
  end

  private

  def flat_params
    params.require(:flat).permit(:address, :zip_code, :city, :country)
  end

  def set_hut
    @hut = Hut.find(params[:id])
  end

end

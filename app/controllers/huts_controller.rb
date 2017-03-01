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

  private

  def set_hut
    @hut = Hut.find(params[:id])
  end
end

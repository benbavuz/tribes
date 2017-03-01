class HutsController < ApplicationController
  def show
    @huts = []
    @huts[0] = @hut
    @hash = Gmaps4rails.build_markers(@huts) do |hut, marker|
    marker.lat hut.latitude
    marker.lng hut.longitude
    end
  end
end

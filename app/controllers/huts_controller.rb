class HutsController < ApplicationController

  def index
    @huts = Hut.all
  end

  def show
    @hut = Hut.find(params[:id])
  end

  def new
    @hut = Hut.new
  end

  def create
    @hut = Hut.new(hut_params)
    @hut.user = current_user
    @hut.save!
  end

  def update
  end

private

def hut_params

params.require(:hut).permit(:name, :address1, :address2, :zip_code, :country, :capacity)
end

end

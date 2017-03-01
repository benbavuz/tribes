class HutsController < ApplicationController

  def index
    @huts = policy_scope(Hut)
  end

  def show
    @hut = Hut.find(params[:id])
  end

  def new
    @hut = Hut.new
    authorize @hut
  end

  def create
    @hut = Hut.new(hut_params)
    authorize @hut
    @hut.user = current_user
    @hut.save!
  end

  def edit
    @hut = Hut.find(params[:id])
  end

  def update
    @hut.update(hut_params)
  end

  def destroy
    @hut.destroy
  end

private

  def hut_params
  params.require(:hut).permit(:name, :address1, :address2, :zip_code, :country, :capacity)
  end

end

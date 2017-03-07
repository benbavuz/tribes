class HutsController < ApplicationController

  def index
    if params[:date].present?

        year = params[:date].to_date.year
        month = params[:date].to_date.month
        day = params[:date].to_date.day
        start_hour = params[:start_user].to_time.hour
        end_hour = params[:end_user].to_time.hour

        start_asked = DateTime.new(year,month,day,start_hour)
        end_asked = DateTime.new(year,month,day,end_hour)
        huts_ids = Availability.where(start_asked == :start_date).pluck(:hut_id)
        @huts = policy_scope(Hut).where(id: huts_ids)
    else
    @huts = policy_scope(Hut)
  end

  end

  def index_by_user
    @user = User.find(params[:user_id])
    @huts = @user.huts
    authorize @huts
  end

  def show
    @hut = Hut.find(params[:id])
    authorize @hut
    # @huts = []
    @hash = Gmaps4rails.build_markers(@hut) do |hut, marker|
    marker.lat hut.latitude
    marker.lng hut.longitude
    end
  end


  def new
    @hut = Hut.new
    authorize @hut
  end

  def create
    @hut = Hut.new(hut_params)
    @hut.user = current_user
    @hut.save!
    authorize @hut

    if @hut.save
      redirect_to user_huts_path(user_id: @hut.user.id)
    else
      render :new
    end
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
    params.require(:hut).permit(:name, :address, :address2, :zip_code, :city, :country, :capacity, :about, photos: [], equipment_ids: [])
  end

end

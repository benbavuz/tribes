class TribesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_tribe, only: [:show, :edit, :update, :destroy]

  def index
    if params[:search].present?
      @tribes = policy_scope(Tribe).find_by_sql("select * FROM tribes
        WHERE id in (select distinct tribes.id FROM tribes, tribe_members, huts
        WHERE LOWER(city) = '#{params[:search]}'
        AND huts.user_id = tribe_members.user_id AND tribe_members.tribe_id = tribes.id)")
    else
      @tribes = policy_scope(Tribe)
    end
  end

  def index_by_user
    @user = User.find(params[:user_id])
    @tribes = @user.tribes
    authorize @tribes
  end

  def show
    authorize @tribe

    user_ids = TribeMember.where(tribe_id: @tribe.id).pluck(:user_id)
    @huts = Hut.where(user_id: user_ids).where("latitude is not null and longitude is not null")
    @hash = Gmaps4rails.build_markers(@huts) do |hut, marker|
      marker.lat hut.latitude
      marker.lng hut.longitude
      # marker.infowindow render_to_string(partial: "lawyers/infowindow", locals: { lawyer: lawyer })
    end
  end

  def new
    @tribe = Tribe.new
    authorize @tribe
  end

  def create
    @tribe = Tribe.new(tribe_params)
    @tribe.save!
    authorize @tribe
    redirect_to tribes_path
  end

  def edit
  end

  def update
    @tribe.update(tribe_params)
    redirect_to tribes_path
  end

  def destroy
    @tribe.destroy
    redirect_to tribes_path
  end

  private

  def tribe_params
    params.require(:tribe).permit(:name, :about, :short_desk, :photo)
  end

  def set_tribe
    @tribe = Tribe.find(params[:id])
  end

end


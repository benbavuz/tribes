class TribesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_tribe, only: [:show, :edit, :update, :destroy, :assign_user]

  def index
    if params[:search].present?
      skill_ids = params[:search][:skills]
      city = params[:search][:city]

      user_ids_with_skills = if skill_ids.present?
        UserSkill.where(skill_id: skill_ids).pluck(:user_id)
      end

      user_ids_in_city = if city.present?
        Hut.where("LOWER(city) = ?", city).pluck(:user_id)
      end


      tribe_scope = if user_ids_with_skills.nil? && user_ids_in_city.nil?
        TribeMember
      elsif !user_ids_with_skills.nil? && user_ids_in_city.nil?
        TribeMember.where(user_id: user_ids_with_skills)
      elsif user_ids_with_skills.nil? && !user_ids_in_city.nil?
        TribeMember.where(user_id: user_ids_in_city)
      else
        TribeMember.where(user_id: user_ids_with_skills & user_ids_in_city)
      end

      tribe_ids = tribe_scope.pluck(:tribe_id)

      @tribes = policy_scope(Tribe).where(id: tribe_scope.pluck(:tribe_id))
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

    @skills = []
    @tribe.users.each do |user|
      user.skills.each do |skill|
       @skills << skill.name
      end
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

  def assign_user
    authorize @tribe
    current_user.tribes << @tribe
    redirect_to user_tribes_path(current_user)
  end

  private

  def tribe_params
    params.require(:tribe).permit(:name, :about, :short_desk, :photo, :requirement)
  end

  def set_tribe
    @tribe = Tribe.find(params[:id])
  end

end


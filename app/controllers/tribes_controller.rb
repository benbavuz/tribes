class TribesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_tribe, only: [:show, :edit, :update, :destroy]

  def index
    @tribes = policy_scope(Tribe)
  end

  def show
    authorize @tribe

    # user_ids = TribeMember.where(tribe_id: @tribe.id).pluck(:user_id)
    # @huts = Hut.where(user_id: user_ids)

    # @hash = Gmaps4rails.build_markers(@huts) do |hut, marker|
    #   marker.lat hut.latitude
    #   marker.lng hut.longitude
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
    params.require(:tribe).permit(:name, :about, :photo)
  end

  def set_tribe
    @tribe = Tribe.find(params[:id])
  end

end

#  # action linked to all users
# class tribesController < ApplicationController
#   skip_before_action :authenticate_user!, only: [:index, :show]

#  # action linked to all users
#   def index

#   end

#   def show
#   end

#   #actions linked to specific user

#   def index_by_user
#     @user = User.find(params[:user_id])
#     @tribes = @user.tribes
#   end

#   def new

#     @tribe.first_name = current_user.first_name
#     @tribe.last_name = current_user.last_name
#     @tribe.email = current_user.email
#     @tribe.phone_number = current_user.phone_number

#   end

#   def create
#
#     @tribe.user = current_user
#     # @tribe.office_photo = blank_image(@tribe)
#
#     if @tribe.save
#       redirect_to user_tribes_path(user_id: @tribe.user.id)
#     else
#       render :new
#     end
#   end

#   def edit
#   end

#   def update
#     if @tribe.user == current_user
#       @user = @tribe.user
#       @tribe.update(tribe_params)
#       redirect_to user_tribes_path(user_id: @tribe.user.id)
#     end
#   end

#   def destroy
#     if @tribe.user == current_user
#       @user = @tribe.user
#
#       # redirect_to user_tribes_path(user_id: @tribe.user.id)
#     end
#   end

#   private


#   # def blank_image(tribe)
#   #   if tribe.office_photo == nil
#   #     'https://askthelaw.ae/wp-content/uploads/2016/12/law-office-tribes-in-your-city.jpg'
#   #   else
#   #     tribe.office_photo
#   #   end
#   # end

# end

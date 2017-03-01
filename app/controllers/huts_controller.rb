class HutsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]
  before_action :set_hut, only: [:show, :edit, :update, :destroy]

  def index
    @huts = hut.all
  end

  def show
  end

  def new
    @hut = hut.new
  end

  def create
    @hut = hut.new(hut_params)
    @hut.save!
    redirect_to huts_path
  end

  def edit
  end

  def update
    @hut.update(hut_params)
    redirect_to huts_path
  end

  def destroy
    @hut.destroy
    redirect_to huts_path
  end

  private

  def hut_params
    params.require(:hut).permit(:name, :about)
  end

  def set_hut
    @hut = hut.find(params[:id])
  end

end

#  # action linked to all users
# class hutsController < ApplicationController
#   skip_before_action :authenticate_user!, only: [:index, :show]

#  # action linked to all users
#   def index

#     if params[:location].present?
#       @huts = hut.near(params[:location])
#     else
#       @huts = hut.where.not(latitude: nil, longitude: nil)
#     end

#     @hash = Gmaps4rails.build_markers(@huts) do |hut, marker|
#       marker.lat hut.latitude
#       marker.lng hut.longitude
#       marker.infowindow render_to_string(partial: "huts/infowindow", locals: { hut: hut })
#     end
#   end

#   def show
#     @huts = []
#     @huts[0] = @hut
#     @hash = Gmaps4rails.build_markers(@huts) do |hut, marker|
#       marker.lat hut.latitude
#       marker.lng hut.longitude
#     end
#   end

#   #actions linked to specific user

#   def index_by_user
#     @user = User.find(params[:user_id])
#     @huts = @user.huts
#   end

#   def new

#     @hut.first_name = current_user.first_name
#     @hut.last_name = current_user.last_name
#     @hut.email = current_user.email
#     @hut.phone_number = current_user.phone_number

#   end

#   def create
#
#     @hut.user = current_user
#     # @hut.office_photo = blank_image(@hut)
#
#     if @hut.save
#       redirect_to user_huts_path(user_id: @hut.user.id)
#     else
#       render :new
#     end
#   end

#   def edit
#   end

#   def update
#     if @hut.user == current_user
#       @user = @hut.user
#       @hut.update(hut_params)
#       redirect_to user_huts_path(user_id: @hut.user.id)
#     end
#   end

#   def destroy
#     if @hut.user == current_user
#       @user = @hut.user
#
#       # redirect_to user_huts_path(user_id: @hut.user.id)
#     end
#   end

#   private


#   # def blank_image(hut)
#   #   if hut.office_photo == nil
#   #     'https://askthelaw.ae/wp-content/uploads/2016/12/law-office-huts-in-your-city.jpg'
#   #   else
#   #     hut.office_photo
#   #   end
#   # end

# end


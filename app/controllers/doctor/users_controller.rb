class Doctor::UsersController < ApplicationController
  before_action :set_user, only: %i[show edit update destroy]

  def index
    if params[:users_type].blank?
      @users = User.all.order(firstname: :asc)
    elsif params[:users_type] == 'Patients'
      @users = User.patients
    elsif params[:users_type] == 'Doctors'
      @users = User.doctors
    end
  end

  def show
    @user = User.find_by(id: params[:id])
  end

  def edit; end

  def update
    @user.update(user_params)

    if @user.save
      redirect_to doctor_user_path(@user)
    else
      render :edit
    end
  end

  def destroy
    @patient = @user.patient
    @doctor = @user.doctor

    if @patient.nil?
      @user.destroy
      @doctor.destroy
    else
      @user.destroy
      @patient.destroy
    end

    flash[:notice] = 'User deleted.'
    redirect_to doctor_users_path
  end

  private

  def set_user
    @user = User.find_by(id: params[:id])
  end

  def user_params
    params.require(:user).permit(:username, :email, :password, :password_confirmation, :firstname, :lastname,
                                 :doctor)
  end
end

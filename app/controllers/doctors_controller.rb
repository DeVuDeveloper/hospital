class DoctorsController < ApplicationController
  def index
    @doctors = if params[:specialty].blank?
                 Doctor.all
               else
                 Doctor.by_specialty(params[:specialty])
               end
  end

  # admin privilege
  # patient can only view limited Doctor's information
  def show
    @doctor = Doctor.find_by(id: params[:id])
  end
end

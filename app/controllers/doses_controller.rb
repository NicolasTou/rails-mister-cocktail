class DosesController < ApplicationController

before_action :doses_require, only: [:destroy]

  def index
    @doses = Dose.All
  end

  def new
    @dose = Dose.new
  end

  def create
    @dose = Dose.new(doses_param)
      if @dose.save
        redirect_to dose_path(@dose)
      else
        render "new"
    end
  end

  def destroy
    @dose = dose.destroy
  end

  def set_doses
    @dose = Dose.find(params[:id])
  end

  def doses_param
    params.require(:dose).require(:name)
  end
end

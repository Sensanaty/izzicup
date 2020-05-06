class PartsController < ApplicationController
  before_action :set_part, only: [:edit, :update, :show]
  def index
  end

  def show
  end

  def new
    @part = Part.new
  end

  def edit
  end

  def update
    if @part.update(part_params)
      redirect_to @part
    else
      render :edit
    end
  end

  private
  def set_part
    @part = Part.find(params[:id])
  end

  def part_params
    params.require(:part).permit!
  end
end

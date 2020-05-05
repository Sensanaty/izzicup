class PartsController < ApplicationController
  before_action :set_part, only: [:edit, :update, :show]
  def index
    @paginated = Part.paginate(page: params[:page], per_page: 10)
  end

  def show
  end

  def new
    @part = Part.new
  end

  def edit
  end

  def update
    @part = Part.find(params[:id])
    if @part.update(params[part_params])
      redirect_to part_path(@part)
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

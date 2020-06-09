class PartsController < ApplicationController
  before_action :authenticate_user!
  before_action :set_part, only: [:edit, :update, :show]
  helper_method :sort_column, :sort_direction

  def index
    @pagy, @parts = pagy(Part.all.order(sort_column + " " + sort_direction))
    @search_bar = params["search_bar"]
    if @search_bar.present?
      @search_term = @search_bar["search_term"]
      @pagy, @parts = Part.where("part_number ILIKE ? OR description ILIKE ? OR tag ILIKE ?", "%#{@search_term}%","%#{@search_term}%","%#{@search_term}%")
    end
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

  def sort_column
    Part.column_names.include?(params[:sort]) ? params[:sort] : "updated_at"
  end

  def sort_direction
    %w[asc desc].include?(params[:direction]) ? params[:direction] : "desc"
  end
end

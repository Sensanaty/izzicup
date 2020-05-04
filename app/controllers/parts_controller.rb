class PartsController < ApplicationController
  def index
    @parts = Part.all
    @paginated = Part.paginate(page: params[:page], per_page: 10)
  end
end

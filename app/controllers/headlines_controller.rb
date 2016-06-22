class HeadlinesController < ApplicationController

  def index
    @headlines = Headline.publicly_visible.asc(:name).paginate per_page: 10, page: params[:page]
  end

  def show
    @headline = Headline.find params[:id]
  end
end

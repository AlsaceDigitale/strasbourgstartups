class HeadlinesController < ApplicationController

  def index
    @headlines = Headline.publicly_visible.paginate per_page: 10, page: params[:page]
  end

  def show
    @headline = Headline.find params[:id]
  end
end

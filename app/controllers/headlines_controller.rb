class HeadlinesController < ApplicationController

  def index
    @headlines = Headline.publicly_visible
    if params[:tag].present?
      @headlines = @headlines.in(tags: params[:tag])
    end
    @headlines = @headlines.paginate per_page: 10, page: params[:page]
  end

  def show
    @headline = Headline.find params[:id]
  end
end

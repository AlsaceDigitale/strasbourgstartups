class HeadlinesController < ApplicationController

  def index
    @headlines = Headline.publicly_visible
    @headlines = @headlines.tagged_with params[:tag] if params[:tag].present?
    @headlines = @headlines.paginate per_page: 10, page: params[:page]
  end

  def show
    @headline = Headline.find params[:id]
  end
end

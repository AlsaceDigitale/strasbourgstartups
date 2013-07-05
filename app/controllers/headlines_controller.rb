class HeadlinesController < ApplicationController
  def index
    @headlines = Headline.all
  end

  def new
    @headline = Headline.new
  end

  def create
    @headline = Headline.new headline_params
  end

  def show
    @headline = Headline.find(params[:id])
  end

  def edit
  end

  protected

  def headline_params
    params.require(:headline).require(:title, :body)
  end
end

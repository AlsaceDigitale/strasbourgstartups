class HeadlinesController < ApplicationController
  def index
    @page_title = "Latests news"
    @headlines = Headline.desc(:published_at)
  end
end

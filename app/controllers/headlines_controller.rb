class HeadlinesController < ApplicationController
  def index
    @page_title = "Latests news from Strasbourg Startups"
    @headlines = Headline.desc(:published_at)
  end
end

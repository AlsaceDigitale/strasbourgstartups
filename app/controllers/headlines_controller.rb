class HeadlinesController < ApplicationController
  def index
    @page_title = "Latest news / Dernières actualités"
    @headlines = Headline.desc(:published_at)
  end
end

class HeadlinesController < ApplicationController
  def index
    @headlines = Headline.desc(:published_at)
  end
end

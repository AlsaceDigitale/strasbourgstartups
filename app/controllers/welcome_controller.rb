class WelcomeController < ApplicationController

  def show
    @headlines = Headline.publicly_visible.limit(3)

    last_startup = Startup.publicly_visible.first
    base_date = last_startup&.added_on || Date.today
    @startups = Startup.publicly_visible.where("added_on >= ?", base_date-3.months)
  end
end

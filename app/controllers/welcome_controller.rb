class WelcomeController < ApplicationController

  def show
    @page_meta_title = "Strasbourg Startups - " + I18n.t("views.welcome.show.page_description")
    @page_title = "Strasbourg Startups"
    @page_description = I18n.t("views.welcome.show.page_description")

    @headlines = Headline.publicly_visible.limit(3)

    last_startup = Startup.publicly_visible.limit(1).first
    base_date = last_startup.added_on
    @startups = Startup.publicly_visible.where(:added_on.gte => base_date-3.months)
  end
end

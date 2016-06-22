class WelcomeController < ApplicationController

  def show
    @page_meta_title = "Strasbourg Startups - " + I18n.t("views.welcome.show.page_description")
    @page_title = "Strasbourg Startups"
    @page_description = I18n.t("views.welcome.show.page_description")

    @headlines = Headline.publicly_visible.limit(3)

    @startups = Startup.publicly_visible.limit(4)
  end
end

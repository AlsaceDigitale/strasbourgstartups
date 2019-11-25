class WelcomeController < ApplicationController

  def show
    @page_meta_title = "French Tech Strasbourg - " + I18n.t("views.welcome.show.page_description")
    @page_title = "French Tech Strasbourg"
    @page_description = I18n.t("views.welcome.show.page_description")

    @headlines = Headline.publicly_visible.limit(3)

    last_startup = Startup.publicly_visible.first
    base_date = last_startup&.added_on || Date.today
    @startups = Startup.publicly_visible.where("added_on >= ?", base_date-3.months)
  end
end

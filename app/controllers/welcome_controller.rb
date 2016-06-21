class WelcomeController < ApplicationController

  def show
    @page_description = I18n.t("views.welcome.show.page_description")
    @page_title = @page_description

    @headlines = Headline.publicly_visible.limit(3)

    @startups = Startup.publicly_visible.limit(5)
  end
end

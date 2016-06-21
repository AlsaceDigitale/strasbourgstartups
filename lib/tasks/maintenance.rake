namespace :maintenance do
  namespace :convert do
    task old_data: :environment do
      Rake::Task["maintenance:convert:old_headlines"].invoke
      Rake::Task["maintenance:convert:old_startups"].invoke
    end

    task old_headlines: :environment do
      hashes = Headline.all.map{|h|
        {
          title_fr:     h["title_fr"],
          title_en:     h["title_en"],
          body_fr:      h["body_fr"],
          body_en:      h["body_en"],
          published_at: h["published_at"]
        }
      }
      Headline.destroy_all
      hashes.each{|hsh|
        markdown = Redcarpet::Markdown.new(Redcarpet::Render::HTML, autolink: true, space_after_headers: true)

        headline = Headline.new
        headline.title = hsh[:title_fr]
        headline.body = markdown.render(hsh[:body_fr])
        headline.published_at = hsh[:published_at]
        headline.save
        I18n.with_locale(:en) do
          headline.title = hsh[:title_en]
          headline.body = markdown.render(hsh[:body_en])
          headline.save
        end
      }
    end

    task old_startups: :environment do
      hashes = Startup.all.map{|h|
        {
          name:           h["name"],
          url:            h["url"],
          street:         h["street"],
          zip_code:       h["zip_code"],
          city:           h["city"],
          email:          h["email"],
          description_fr: h["description_fr"],
          description_en: h["description_en"],
          is_published:   h["is_published"]
        }
      }
      Startup.delete_all
      # Startup.destroy_all
      # hashes.each{|hsh|
      #   startup = Startup.new
      #   startup.name = hsh[:name]
      #   startup.url = hsh[:url]
      #   startup.street = hsh[:street]
      #   startup.zip_code = hsh[:zip_code]
      #   startup.city = hsh[:city]
      #   startup.email = hsh[:email]
      #   startup.is_published = hsh[:is_published]
      #   startup.description = hsh[:description_fr]
      #   statrtup.save
      #   I18n.with_locale(:en) do
      #     startup.description = hsh[:description_en]
      #     startup.save
      #   end
      # }

      User.destroy_all

      user = User.new email: "hello@strasbourg-startups.com", password: "pipomolo", password_confirmation: "pipomolo", is_admin: true
      user.confirm
      user.save!
    end
  end
end

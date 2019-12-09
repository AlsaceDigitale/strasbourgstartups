namespace :maintenance do
  task mongo_to_pg: :environment do
    Legacy::Page.all.each do |legacy_page|
      Page.create! code: legacy_page.code,
                   title: legacy_page.title,
                   body: legacy_page.body
    end
    Legacy::User.all.each do |legacy_user|
      user = User.new email: legacy_user.email,
                   created_at: legacy_user.created_at,
                   updated_at: legacy_user.updated_at,
                   encrypted_password: legacy_user.encrypted_password,
                   reset_password_token: legacy_user.reset_password_token,
                   remember_created_at: legacy_user.remember_created_at,
                   sign_in_count: legacy_user.sign_in_count,
                   current_sign_in_at: legacy_user.current_sign_in_at,
                   last_sign_in_at: legacy_user.last_sign_in_at,
                   current_sign_in_ip: legacy_user.current_sign_in_ip,
                   last_sign_in_ip: legacy_user.last_sign_in_ip,
                   confirmation_token: legacy_user.confirmation_token,
                   confirmed_at: legacy_user.confirmed_at,
                   confirmation_sent_at: legacy_user.confirmation_sent_at,
                   unconfirmed_email: legacy_user.unconfirmed_email,
                   is_admin: legacy_user.is_admin,
                   first_name: legacy_user.first_name,
                   last_name: legacy_user.last_name
      user.define_singleton_method(:password_required?) { false }
      user.skip_confirmation!
      user.save!
    end
    Legacy::Headline.all.each do |legacy_headline|
      headline = Headline.create! title: legacy_headline.title,
                                  body: legacy_headline.body,
                                  created_at: legacy_headline.created_at,
                                  updated_at: legacy_headline.updated_at,
                                  published_at: legacy_headline.published_at,
                                  is_focus: legacy_headline.is_focus,
                                  tag_list: legacy_headline.tag_list
      if legacy_headline.banner.file?
        url = legacy_headline.banner.url.gsub('legacy/', '')
        file = URI.open(url)
        headline.banner.attach(io: file,
                               filename: legacy_headline.banner_file_name,
                               content_type: legacy_headline.banner_content_type)
        headline.save
      end
    end
    Legacy::Startup.all.each do |legacy_startup|
      startup = Startup.create! name: legacy_startup.name,
                                url: legacy_startup.url,
                                street: legacy_startup.street,
                                zip_code: legacy_startup.zip_code,
                                city: legacy_startup.city,
                                email: legacy_startup.email,
                                description: legacy_startup.description,
                                is_published: legacy_startup.is_published,
                                created_at: legacy_startup.created_at,
                                updated_at: legacy_startup.updated_at,
                                added_on: legacy_startup.added_on,
                                tag_list: legacy_startup.tag_list

      emails = legacy_startup.legacy_users.map(&:email)
      if emails.any?
        user_ids = User.where(email: emails).to_a.map(&:id)
        if user_ids
          startup.update({
            user_ids: user_ids
          })
        end
      end

      if legacy_startup.logo.file?
        url = legacy_startup.logo.url.gsub('legacy/', '')
        file = nil
        begin
          file = URI.open(url)
        rescue OpenURI::HTTPError
        end
        if file
          startup.logo.attach(io: file,
                              filename: legacy_startup.logo_file_name,
                              content_type: legacy_startup.logo_content_type)
          startup.save
        end
      end
    end
  end
end

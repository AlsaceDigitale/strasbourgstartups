module Taggable
  extend ActiveSupport::Concern

  included do
    field :tags, type: Array, default: [], localize: true
  end

  def tag_list=(tags)
    self.tags = tags.to_s.split(",").collect{ |t| t.strip }.delete_if{ |t| t.blank? }
  end

  def tag_list
    self.tags.join(", ") if tags
  end

  def tags
    super || []
  end

  def tag_list_translations
    tags_translations.inject({}) do |memo,(k,v)|
      memo[k] = v.join(", ")
      memo
    end
  end

  def tag_list_translations=(hsh)
    hsh.each do |k,v|
      I18n.with_locale(k) do
        self.tags = v.to_s.split(",").collect{ |t| t.strip }.delete_if{ |t| t.blank? }
      end
    end
  end
end

class MetaTag < ApplicationRecord
  has_many :meta_templates
  has_many :entry_meta_tags
end

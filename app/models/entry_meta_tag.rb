class EntryMetaTag < ApplicationRecord
  belongs_to :meta_tag
  belongs_to :entry
end

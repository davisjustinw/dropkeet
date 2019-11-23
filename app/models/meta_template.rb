class MetaTemplate < ApplicationRecord
  belongs_to :inventory_item
  belongs_to :meta_tag
end

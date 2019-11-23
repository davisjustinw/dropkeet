class ItemHashTag < ApplicationRecord
  belongs_to :item
  belongs_to :hash_tag
end

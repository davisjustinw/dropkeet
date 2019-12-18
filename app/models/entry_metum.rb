class EntryMetum < ApplicationRecord
  belongs_to :entry
  belongs_to :metum

  def self.index_hash
    all.inject({}) do |hash, entry_metum|
      entry_id = entry_metum.entry_id
      metum_id = entry_metum.metum_id
      value = entry_metum.value

      hash[entry_id] = {} if !hash[entry_id]
      hash[entry_id][metum_id] = { value: value, obj: entry_metum }
      hash
    end
  end
end

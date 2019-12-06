require 'csv'

#build locations

csv_path = Pathname( Rails.root.join('lib', 'seeds', 'locations.csv') )

if csv_path.exist?
  puts 'Seeding Inventorys ...'
  csv_text = File.read csv_path
  csv = CSV.parse( csv_text, :headers => true, :encoding => 'ISO-8859-1' )
  csv.each do |row|
    l = Inventory.new
    l.name = row['name']
    l.save
  end
else
  puts 'No /lib/seeds/items.csv present'
end

puts "There are now #{Inventory.count} rows in the Location table"

#build items
csv_path = Pathname( Rails.root.join('lib', 'seeds', 'items.csv') )

if csv_path.exist?
  # Adult NC,category:airway,bls
  # name,tag_hash,tag
  puts 'Seeding items...'
  csv_text = File.read csv_path
  csv = CSV.parse( csv_text, :headers => true, :encoding => 'ISO-8859-1' )
  csv.each do |row|
    i = Item.new
    i.name = row['name']
    i.save

    category, value = row['tag_hash'].split(':')
    hash_tag = HashTag.find_or_create_by(category: category, value: value)
    i.hash_tags << hash_tag if hash_tag

    tag = HashTag.find_or_create_by(value: row['tag'])
    i.hash_tags << tag if tag

    if row['meta']
      meta_data = row['meta'].split(', ')
      meta_data.each do |meta|
        MetaTag.find_or_create_by(name: meta).tap do |tag|
          i.meta_tags << tag
        end
      end
    end
  end
else
  puts 'No /lib/seeds/items.csv present'
end

puts "There are now #{Item.count} rows in the Item table"
puts "There are now #{HashTag.count} rows in the HashTag table"
puts "There are now #{MetaTag.count} rows in the MetaTag table"

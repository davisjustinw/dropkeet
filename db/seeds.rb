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

puts "There are now #{Inventory.count} rows in the Inventory table"

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


    tag = Tag.find_or_create_by(label: row['tag_hash'])
    i.tags << tag if tag

    tag = Tag.find_or_create_by(label: row['tag'])
    i.tags << tag if tag


  end
else
  puts 'No /lib/seeds/items.csv present'
end

puts "There are now #{Item.count} rows in the Item table"
puts "There are now #{Tag.count} rows in the Tag table"

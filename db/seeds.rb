require 'csv'

#build locations

csv_path = Pathname( Rails.root.join('lib', 'seeds', 'locations.csv') )

if csv_path.exist?
  puts 'Seeding locations...'
  csv_text = File.read csv_path
  csv = CSV.parse( csv_text, :headers => true, :encoding => 'ISO-8859-1' )
  csv.each do |row|
    l = Location.new
    l.name = row['name']
    l.save
  end
else
  puts 'No /lib/seeds/items.csv present'
end

puts "There are now #{Location.count} rows in the Location table"

#build items
csv_path = Pathname( Rails.root.join('lib', 'seeds', 'items.csv') )

if csv_path.exist?
  puts 'Seeding items...'
  csv_text = File.read csv_path
  csv = CSV.parse( csv_text, :headers => true, :encoding => 'ISO-8859-1' )
  csv.each do |row|
    i = Item.new
    i.name = row['name']
    i.save
  end
else
  puts 'No /lib/seeds/items.csv present'
end

puts "There are now #{Item.count} rows in the Item table"

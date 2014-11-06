# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


# Spree::Core::Engine.load_seed if defined?(Spree::Core)
# Spree::Auth::Engine.load_seed if defined?(Spree::Auth)

spreadsheet = Roo::CSV.new("#{Rails.root}/db/state.csv")
header = spreadsheet.row(1)
(2..spreadsheet.last_row).each do |i|
    row = Hash[[header, spreadsheet.row(i)].transpose]
    
    state = SpreeState.where(name: row["name"], abbr: row["abbr"], country_id: row["country_id"]).first_or_create
      
    stare.update_attributes({name: row["name"], abbr: row["abbr"], country_id: row["country_id"]})
end

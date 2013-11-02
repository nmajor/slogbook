# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

['Tip','Advise','Mission Description','Story'].each do |st|
  SlogType.find_or_create_by_name(st)
end

open("#{Rails.root}/db/seeds/missions.csv") do |missions|
  missions.read.each_line do |mission|
    name, region, active = mission.chomp.split(',')
    Mission.create!(:name => name, :region => region, :active => active)
  end
end

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'csv'

csv_text = File.read(Rails.root.join('lib', 'seeds', 'Hartley_6_Roster_Final.csv'))
csv = CSV.parse(csv_text, :headers => true, :encoding => 'ISO-8859-1')
csv.each do |row|
	if !User.find_by(email: row[4]).nil?
		u = User.find_by(email: row[4])
		u.first_name = row[2]
		u.last_name = row[1]
		u.room = row[0]
		u.uni = row[3]
		u.password = 'foobar'
		if u.save!
			puts u
		end
		puts "exists"
	else
		u = User.new
		u.first_name = row[2]
		u.last_name = row[1]
		u.room = row[0]
		u.uni = row[3]
		u.email = row[4]
		u.password = 'foobar'
		if u.save!
			puts u
		end
		puts u
	end
end
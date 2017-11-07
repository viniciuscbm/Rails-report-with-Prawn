puts "Create Resource..."

10.times do
	Resource.create!(name: Faker::Lorem.sentence,
	description: Faker::Lorem.paragraph(500),
	initial: Date.current.to_date,
	deadline: Date.current.to_date + 10)
end

puts "Create RESOURCE [END]"

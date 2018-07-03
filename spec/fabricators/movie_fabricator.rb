Fabricator(:movie) do
  title       { Faker::Name.unique.name }
  year        { Faker::Date.between(30.days.ago, Date.today) }
  description { Faker::Lorem.paragraph(3) }
  genre       { Faker::Lorem.word }
end

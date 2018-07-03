Fabricator(:comment) do
  text       { Faker::Lorem.paragraph(3) }
end

Fabricator(:user) do
  name      { Faker::LordOfTheRings.unique.character }
  email     { Faker::Internet.unique.email }
  role      %w(user admin moderator).sample
  password  "123456"
end

require 'faker'
Fabricator(:user) do
  email { Faker::Internet.unique.email}
  first_name { Faker::Name.name.split(' ').first }
  last_name { Faker::Name.name.split(' ').last }
  password { Faker::Internet.password }
end
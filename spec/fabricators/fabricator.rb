require 'faker'
Fabricator(:user) do
  email { Faker::Internet.unique.email}
  first_name { Faker::Name.name }
  last_name { Faker::Name.name }
  password { Faker::Internet.password }
end
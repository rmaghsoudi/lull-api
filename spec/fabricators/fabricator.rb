require 'faker'
Fabricator(:user) do
  email { Faker::Internet.unique.email}
  first_name { Faker::Name.name.split(' ').first }
  last_name { Faker::Name.name.split(' ').last }
  # using a string because the faker wasn't consistent with the requirements, even with args
  password { '&&@!^&HwM5B08fFjUf' }
end
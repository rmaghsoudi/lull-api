require 'faker'
Fabricator(:user) do
  email { Faker::Internet.unique.email}
  full_name { Faker::Name.name }
  # using a string because the faker wasn't consistent with the requirements, even with args
  password { '&&@!^&HwM5B08fFjUf' }
end
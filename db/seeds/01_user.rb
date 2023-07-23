User.create(
  user_name: 'admin',
  email: 'admin@example.com',
  password: 'password',
  password_confirmation: 'password',
  role: 1
)

puts 'Start inserting seed "users" ...'
10.times do
  user = User.create(
    user_name: Faker::Internet.unique.user_name,
    email: Faker::Internet.unique.email,
    password: 'password',
    password_confirmation: 'password',
    role: 0
  )
  puts "\"#{user.user_name}\" has created!"
end
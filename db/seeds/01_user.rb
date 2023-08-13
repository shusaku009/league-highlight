User.create(
  user_name: 'admin',
  email: ENV['ADMIN_EMAIL'],
  password: ENV['ADMIN_PASSWORD'],
  password_confirmation: ENV['ADMIN_PASSWORD'],
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
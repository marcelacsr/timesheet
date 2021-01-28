return if User.exists?

randomPassword = Devise.friendly_token.first(8)

10.times do |n|
  User.create!(
    email: "email#{n + 1}@email.com",
    password: randomPassword,
    created_at: Date.today - 1,
    updated_at: Date.today
  )
end

User.create!(
  email: 'email@email.com',
  password: '123456',
  created_at: Date.today - 1,
  updated_at: Date.today
)
puts ' users seed finished '

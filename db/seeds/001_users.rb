User.find_or_create_by(
  email: 'email@email.com',
  encrypted_password: '123',
  created_at: Date.today - 1,
  updated_at: Date.today
)

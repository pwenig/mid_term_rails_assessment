def create_user(overrides = {})
  User.create!({
                 name: 'Some User',
                 email: 'user@example.com',
                 password: 'password',
                 password_confirmation: 'password'
               }.merge(overrides))
end

def create_user2(overrides = {})
  User.create!({
                 name: 'Another User',
                 email: 'user2@example.com',
                 password: 'password',
                 password_confirmation: 'password'
               }.merge(overrides))
end
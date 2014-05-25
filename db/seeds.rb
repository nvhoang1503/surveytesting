# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

admin = User.find_by(email: 'admin@surveytesting.com')
unless admin
  User.create(email: 'admin@surveytesting.com',
             password: '1234qwer',
             password_confirmation: '1234qwer',
             role: User::ROLE[:admin])
else
  admin.update_attribute :role, User::ROLE[:admin]
end
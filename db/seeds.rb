# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)


User.find_or_create_by(email: 'admin@email.com') do |user|
  user.name = 'admin',
  user.admin = ture,
  user.password = 'password',
  user.password_confirmation = 'password'
end

(1..50).each do |i|
  Memo.create!(
    title: "title#{i}",
    content: "content#{i}",
    user_id: 1
  )
end
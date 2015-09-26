# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

attractions = [
  {
    title: 'True Detective',
    media: 'television',
    day: 1.hour.from_now
  },
  {
    title: 'interstellar',
    media: 'cinema',
    day: 1.day.from_now
  },
  {
    title: 'Is TDD dead?',
    media: 'Hangout',
    day: 8.hours.from_now
  },
]

user = User.create( email: 'example@email.com', password: 'password', nick_name: 'OCTC' )
user.attractions.create( attractions )

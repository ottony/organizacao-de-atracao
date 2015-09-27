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
    media: 'TV',
    day: 1.hour.from_now,
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer non auctor mauris.'
  },
  {
    title: 'interstellar',
    media: 'cinema',
    day: 1.day.from_now,
    description: 'Aenean massa nisi, pharetra in sodales at, elementum vitae metus.'
  },
  {
    title: 'Breaking Bad',
    media: 'TV',
    day: 8.hours.from_now,
    description: 'Phasellus non imperdiet enim. Etiam a suscipit lectus.'
  },
  {
    title: 'System of a Down',
    media: 'YouTube',
    day: 2.day.from_now,
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
  },
  {
    title: 'Notch Coding',
    media: 'Twitch',
    day: 10.days.from_now,
    description: 'Curabitur scelerisque ligula ut ante molestie, ut fringilla ex condimentum. Quisque aliquam nulla sed mi cursus tincidunt. '
  },
]

user = User.create( email: 'example@email.com', password: 'password', nick_name: 'OCTC' )
user.attractions.create( attractions )

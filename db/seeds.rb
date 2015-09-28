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
    day: 30.hour.from_now,
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Integer non auctor mauris.'
  },
  {
    title: 'interstellar',
    media: 'cinema',
    day: 2.day.from_now,
    description: 'Aenean massa nisi, pharetra in sodales at, elementum vitae metus.'
  },
  {
    title: 'Breaking Bad',
    media: 'TV',
    day: 50.hours.from_now,
    description: 'Phasellus non imperdiet enim. Etiam a suscipit lectus.'
  },
  {
    title: 'System of a Down',
    media: 'YouTube',
    day: 3.day.from_now,
    description: 'Lorem ipsum dolor sit amet, consectetur adipiscing elit.'
  },
  {
    title: 'Notch Coding',
    media: 'Twitch',
    day: 10.days.from_now,
    description: 'Curabitur scelerisque ligula ut ante molestie, ut fringilla ex condimentum.'
  },
  {
    title: 'House Of Cards',
    media: 'TV',
    day: 5.days.from_now,
    description: 'Curabitur scelerisque ligula ut ante molestie, ut condimentum.'
  }
]

user = User.create( email: 'example@email.com', password: 'password', nick_name: 'OCTC' )
user.attractions.create( attractions )

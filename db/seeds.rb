# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create([

    {username: "rubykim", password: "1234"},
    {username: "changwon", password: "1234"}
])


Post.create([

    {title: "첫번째 글", content: "야호", user_id: 1},
    {title: "두번째 글", content: "네네", user_id: 2}
])

# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

article1 = Article.create([
    {
        title: "The Trhone of Miracle",
        description: "This is movie which inspirate by other"
    }
])

comment1 = Comment.create([
    {
        owner: "Stevan Blotzhman",
        article_id: 1,
        message: "This is a message"
    }
])

comment2 = Comment.create([
    {
        owner: "Stevan Rock",
        article_id: 1,
        message: "This is a message2"
    }
])



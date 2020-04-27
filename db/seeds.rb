# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Word.destroy_all

data = File.readlines("/home/mael/Documents/liste_francais.txt")
i= 0
data.each do |w|
    i += 1
    a = w.chars
    a.pop
    a.pop  
    Word.create(word: a.join.upcase)

end
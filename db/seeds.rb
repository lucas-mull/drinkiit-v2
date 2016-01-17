# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

cat_sandwich = Category.create(name: 'Sandwiches', description: 'De délicieux sandwiches préparés par nos soins. Choisissez votre recette préférée !')
cat_snack = Category.create(name: 'Snacks', description: 'Un petit creux ? Une envie soudaine de mal-bouffe ? C\'est par ici !')
cat_boissons = Category.create(name: 'Boissons', description: 'Désaltérez-vous grâce à notre large choix de sodas !')

Meal.create(price: 0.6, standalone: true, description: 'Bueno', category_id: cat_snack.id)
Meal.create(price: 0.6, standalone: true, description: 'Sprite', category_id: cat_boissons.id)

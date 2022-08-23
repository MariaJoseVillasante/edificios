# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

require 'faker'

# for i in (0..15)
#     i = Edificio.create([
#             {nombre: Faker::Artist.name,
#             direccion: Faker::Address.street_address,
#             ciudad: Faker::Address.city}
#         ])
# end

#Cliente.create(nombre: "Luke", apellido: "Luke", email: )

# for i in (1..10)
#     i = Departamento.create([
#         {numero: rand(100..999),
#         edificio_id: rand(1..16),
#         cliente_id: rand(1..10)}
#     ])
# end

# for i in (1..10)
#     i = Cliente.create([
#         {nombre: Faker::Name.first_name,
#         apellido: Faker::Name.last_name,
#         email: Faker::Internet.free_email,
#         telefono: rand(100111..9999999)}
#     ])
# end
for i in (1..22)
    i = Blog.create([
        {title: Faker::TvShows::GameOfThrones.house,
        image_url: Faker::Avatar.image(slug: "my-own-slug", size: "50x50"),
        content: Faker::TvShows::GameOfThrones.quote,
        author: Faker::TvShows::GameOfThrones.character,
        status: rand(0..1)}
    ])
end

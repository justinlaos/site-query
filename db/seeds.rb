# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)

User.create!({
    email: "test@test.com",
    password: "password",
    password_confirmation: "password"
})

Portfolio.create!({
    user_id: 1,
    name: "North America Portfolio"
})

Site.create!({
    portfolio_id: 1,
    name: "East Side",
    address: "1234 E city"
})
Site.create!({
    portfolio_id: 1,
    name: "North Side",
    address: "1234 N city"
})

Space.create!({
    site_id: 1,
    name: "Park",
    square_footage: 800,
    space_type: 3
})
Space.create!({
    site_id: 1,
    name: "Apartment One",
    square_footage: 35000,
    space_type: 2
})
Space.create!({
    site_id: 2,
    name: "Costco",
    square_footage: 85000,
    space_type: 1
})

p "Created Demo Seed Data. login with email: test@test.com and password: password "

theo = User.create(username: "Theo", password: "123")
eric = User.create(username: "Eric", password: "123")

Snack.create(name: "Sour worms", user: theo)
Snack.create(name: "Junior Mints", user: theo)
Snack.create(name: "Haribo Happy Cola", user: eric)

puts "done seeding 👍"
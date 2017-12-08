require("pry-byebug")
require_relative("./models/customer")
require_relative("./models/film")

Customer.delete_all()
Film.delete_all()

customer_1 = Customer.new({
  "name" => "Alison",
  "funds" => "20"
})
customer_2 = Customer.new({
  "name" => "Hilary",
  "funds" => "30"
})
customer_3 = Customer.new({
  "name" => "Findlay",
  "funds" => "10"
})

customer_1.save()
customer_2.save()
customer_3.save()

customer_1.name = "Alison Wood"
customer_1.update()

film_1 = Film.new({
  "title" => "Love Actually",
  "price" => "8"
  })
film_2 = Film.new({
  "title" => "Polar Express",
  "price" => "5"
  })
film_3 = Film.new({
  "title" => "It's a Wonderful Life",
  "price" => "6"
  })

  film_1.save()
  film_2.save()
  film_3.save()

  film_1.price = "10"
  film_1.update()


customers = Customer.all()
films = Film.all()

binding.pry
nil

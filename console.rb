require("pry-byebug")
require_relative("./models/customer")
require_relative("./models/film")
require_relative("./models/ticket")

Ticket.delete_all()
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


ticket_1 = Ticket.new({
  "customer_id" => customer_1.id,
  "film_id" => film_1.id
  })
ticket_2 = Ticket.new({
  "customer_id" => customer_2.id,
  "film_id" => film_1.id
  })
ticket_3 = Ticket.new({
  "customer_id" => customer_3.id,
  "film_id" => film_2.id
  })
ticket_4 = Ticket.new({
  "customer_id" => customer_1.id,
  "film_id" => film_2.id
  })
ticket_5 = Ticket.new({
  "customer_id" => customer_2.id,
  "film_id" => film_3.id
  })

ticket_1.save()
ticket_2.save()
ticket_3.save()
ticket_4.save()
ticket_5.save()

ticket_5.customer_id = customer_3.id
ticket_5.update()

films_customers = film_1.customers()
customers_films = customer_1.films()

customer_1.buy_ticket(film_1)

customers = Customer.all()
films = Film.all()
tickets = Ticket.all()


binding.pry
nil

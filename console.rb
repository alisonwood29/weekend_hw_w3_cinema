require("pry-byebug")
require_relative("./models/customer")
require_relative("./models/film")
require_relative("./models/ticket")
require_relative("./models/screening")

Screening.delete_all()
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
  "price" => 8
  })
film_2 = Film.new({
  "title" => "Polar Express",
  "price" => 5
  })
film_3 = Film.new({
  "title" => "It's a Wonderful Life",
  "price" => 6
  })

film_1.save()
film_2.save()
film_3.save()

film_1.price = 10
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

ticket_6 = customer_2.buy_ticket(film_1)

ticket_5.customer_id = customer_3.id
ticket_5.update()

films_customers = film_2.customers()
customers_films = customer_1.films()

film_customer_num = film_2.customer_number()

customer_film_num = customer_2.number_films_seen()

screening_1 = Screening.new({
  "film_id" => film_1.id,
  "film_time" => "7:00pm"
  })
screening_2 = Screening.new({
  "film_id" => film_2.id,
  "film_time" => "8:00pm"
  })
screening_3 = Screening.new({
  "film_id" => film_3.id,
  "film_time" => "9:00pm"
  })

screening_1.save()
screening_2.save()
screening_3.save()

screening_1.film()




customers = Customer.all()
films = Film.all()
tickets = Ticket.all()
screenings = Screening.all()


binding.pry
nil

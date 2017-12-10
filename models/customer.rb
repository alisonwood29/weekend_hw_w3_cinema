require_relative("../db/sql_runner")
class Customer

attr_reader :id
attr_accessor :name, :funds

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @name = options["name"]
    @funds = options["funds"].to_i
  end

  def save()
    sql = "INSERT INTO customers (name, funds)
          VALUES ($1, $2)
          RETURNING id"
    values = [@name, @funds]
    customer = SqlRunner.run(sql, values)
    customer = customer.first
    @id = customer["id"].to_i
  end

  def update()
    sql = "UPDATE customers
          SET (name, funds) = ($1, $2)
          WHERE id = $3"
    values = [@name, @funds, @id]
    SqlRunner.run(sql, values)
  end

  def films()
    sql = "SELECT films.* FROM films
          INNER JOIN tickets
          ON tickets.film_id = films.id
          WHERE tickets.customer_id = $1"
    values = [@id]
    films_hashes = SqlRunner.run(sql, values)
    return films_hashes.map{|films_hash| Film.new(films_hash)}
  end

  def number_films_seen()
    return films.count
  end

  def buy_ticket(film)
    ticket = Ticket.new({"customer_id" => @id, "film_id" => film.id})
    @funds -= film.price
    ticket.save()
    update()
    return ticket
  end

  def Customer.all()
    sql = "SELECT * FROM customers"
    customer_hashes = SqlRunner.run(sql)
    customer = customer_hashes.map{|customer_hash| Customer.new(customer_hash)}
    return customer
  end

  def Customer.delete_all()
    sql = "DELETE FROM customers"
    SqlRunner.run(sql)
  end







end

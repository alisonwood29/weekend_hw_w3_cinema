class Ticket

  attr_reader :id
  attr_accessor :customer_id, :film_id

def initialize(options)
  @id = options["id"].to_i if options["id"]
  @customer_id = options["customer_id"].to_i
  @film_id = options["film_id"]
end

def save()
  sql = "INSERT INTO tickets (customer_id, film_id)
        VALUES ($1, $2)
        RETURNING id"
  values = [@customer_id, @film_id]
  result = SqlRunner.run(sql, values)
  @id = result[0]["id"].to_i
end

def update()
  sql = "UPDATE tickets
        SET (customer_id, film_id) = ($1, $2)
        WHERE id = $3 "
  values = [@customer_id, @film_id, @id]
  SqlRunner.run(sql, values)
end

def Ticket.all()
  sql = "SELECT * FROM tickets"
  ticket_hashes = SqlRunner.run(sql)
  return ticket_hashes.map{|ticket_hash| Ticket.new(ticket_hash)}
end

def Ticket.delete_all()
  sql = "DELETE FROM tickets"
  SqlRunner.run(sql)
end


end

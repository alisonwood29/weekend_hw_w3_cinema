require_relative("../db/sql_runner")
class Screening

  attr_reader :id
  attr_accessor :film_id, :film_time

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @film_id = options["film_id"]
    @film_time = options["film_time"]
  end

  def save()
    sql = "INSERT INTO screenings (film_id, film_time)
          VALUES ($1, $2)
          RETURNING id"
    values = [@film_id, @film_time]
    result = SqlRunner.run(sql, values).first
    @id = result["id"].to_i
  end

  def film()
    sql = "SELECT films.*  FROM films
          INNER JOIN screenings
          ON screenings.film_id = films.id
          WHERE screenings.id = $1;"
    values = [@id]
    film_hash = SqlRunner.run(sql, values)
    return film_hash[0]
  end

  def Screening.all()
    sql = "SELECT * FROM screenings"
    screening_hashes = SqlRunner.run(sql)
    return screening_hashes.map {|screening| Screening.new(screening)}
  end

  def Screening.delete_all()
    sql = "DELETE FROM screenings"
    SqlRunner.run(sql)
  end



end

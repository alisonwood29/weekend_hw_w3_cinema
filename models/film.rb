class Film

  attr_reader :id
  attr_accessor :title, :price

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @title = options["title"]
    @price = options["price"].to_i
  end

  def save()
    sql = "INSERT INTO films (title, price)
          VALUES ($1, $2)
          RETURNING id"
    values = [@title, @price]
    result = SqlRunner.run(sql, values)
    @id = result.first["id"].to_i
  end

  def Film.all()
    sql = "SELECT * FROM films"
    films_hashes = SqlRunner.run(sql)
    return films_hashes.map {|film_hash| Film.new(film_hash)}
  end


end

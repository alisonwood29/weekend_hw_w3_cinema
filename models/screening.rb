require_relative("../db/sql_runner")
class Screening

  attr_reader :id
  attr_accessor :film_id, :time

  def initialize(options)
    @id = options["id"].to_i if options["id"]
    @film_id = options["film_id"]
    @time = options["time"]
  end



end

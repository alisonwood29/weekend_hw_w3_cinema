class Customer

  def initialize(options)
    @id = options["id"] if options["id"]
    @name = options["name"]
    @funds = options["funds"]
  end


end

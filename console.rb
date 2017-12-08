require("pry-byebug")
require_relative("./models/customer")

Customer.delete_all()

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

customers = Customer.all()

binding.pry
nil

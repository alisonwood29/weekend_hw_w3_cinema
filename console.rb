require("pry-byebug")
require_relative("./models/customer")

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

binding.pry
nil

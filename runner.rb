require('pry')
require_relative('models/customer.rb')
require_relative('models/film.rb')

binding.pry
customers = Customer.all
films = Film.all

nil

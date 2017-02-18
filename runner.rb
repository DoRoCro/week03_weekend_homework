require('pry')
require_relative('models/customer.rb')
require_relative('models/film.rb')

customers = Customer.all
films = Film.all
a_customer = Customer.find_by_id( customers[0].id )
a_film = Film.find_by_id( films[0].id )
binding.pry
nil

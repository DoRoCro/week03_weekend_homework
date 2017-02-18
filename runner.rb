require('pry')
require_relative('models/customer.rb')
require_relative('models/film.rb')
require_relative('models/screening.rb')
require_relative('models/ticket.rb')

customers = Customer.all
films = Film.all
a_customer = Customer.find_by_id( customers[0].id )
a_film = Film.find_by_id( films[0].id )
customer4 = Customer.new({
  'name' => "D Davies",
  'funds' => 543.21
  })
customer4.save
film4 = Film.new({
  'title' => "testing_La La LaLa Land",
  'duration_mins' => 140
  })
film4.save

screenings = Screening.all
a_screening = Screening.find_by_id(1)
a_screening.showtime = "2017-02-21 21:00:00"
a_screening.update
a_screening.price = 6.75
a_screening.update
customer4.change_name("Zaphod Beeblebrox")
customer4.update
a_film.change_title("testing_STAR WARS")
a_film.update
binding.pry
tickets = Ticket.all()


#Film.delete_all
#Customer.delete_all




nil

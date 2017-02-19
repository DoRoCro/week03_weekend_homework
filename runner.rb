require('pry')
require_relative('models/customer.rb')
require_relative('models/film.rb')
require_relative('models/screening.rb')
require_relative('models/ticket.rb')

if system('db/initialise.sh')
else
  puts "Remember to re-initialise database with data or some methods fail..."
end

# Test initial retrieve methods
customers = Customer.all
films = Film.all
a_customer = Customer.find_by_id( customers[0].id )
a_film = Film.find_by_id( films[0].id )

# Test Create methods
customer4 = Customer.new({
  'name' => "testing_D Davies",
  'funds' => 543.21
  })
customer4.save
film4 = Film.new({
  'title' => "testing_La La LaLa Land",
  'duration_mins' => 140
  })
film4.save

#  Test all() method on existing data after adding Screening class
screenings = Screening.all
a_screening = Screening.find_by_id(1)

# Test update methods
a_screening.showtime = "2017-02-21 21:00:00"
a_screening.update
a_screening.price = 6.75
a_screening.update
customer4.change_name("testing_Zaphod Beeblebrox")
customer4.update
a_film.change_title("testing_STAR WARS")
a_film.update

# Test tickets methods after adding Ticket class
tickets = Ticket.all()
tickets.each do |ticket|
  puts ticket.customer.name + " goes to screening at " + ticket.screening.showtime + " to see "+ ticket.film.title + " having paid " + ticket.paid.to_s
end

deleted = tickets[0].delete    # fails when no tickets in database

tickets = Ticket.all()
puts "After deleting first ticket id = " + deleted.id.to_s
tickets.each do |ticket|
  puts ticket.customer.name + " goes to screening at " + ticket.screening.showtime + " to see "+ ticket.film.title + " having paid " + ticket.paid.to_s + " on ticket id = " + ticket.id.to_s
end

# Test basic cash handling
puts "Customer #{customer4.name} has £#{customer4.funds}"
new_tickets = customer4.buys_tickets(a_screening, 4)
puts "#{customer4.name} bought #{new_tickets.count.to_s} to #{new_tickets.first.screening.film.title} "
sum_paid = 0.0
new_tickets.each do |t| 
  sum_paid += t.paid.to_f
end
puts "and paid £#{sum_paid}"
puts "leaving £#{customer4.funds}"
puts
total_income = 0.0
Ticket.all.each do |t|
  total_income += t.paid.to_f
end
puts "Total cinema revenue to date = #{total_income}"
puts

# Test tickets() method against customer object
puts "#{customer4.name} has #{customer4.tickets.count} tickets"

# Test customers_for_film() method against films
films = Film.all()
films.each do |film|
  puts "Film #{film.title} has customer list: "
  film.customers.each do |customer|
    puts " #{customer.name}; "
  end
end

# Test tickets for customer
puts "#{customer4.name} has  #{customer4.tickets.count}"
customer4.tickets.each do |ticket|
  puts "#{ticket.screening.showtime} to see #{ticket.screening.film.title}"
end

# Test delete_all method
puts
puts "testing delete_all Films and Customers cascades to tickets and screenings"
puts "Tickets in database = #{Ticket.all.count}"
puts "Screenings available = #{Screening.all.count}"
Film.delete_all
Customer.delete_all
puts "after delete_all:"
puts "Tickets in database = #{Ticket.all.count}"
puts "Screenings available = #{Screening.all.count}"

puts "Remember to re-initialise database with data or some methods fail..."
binding.pry
nil

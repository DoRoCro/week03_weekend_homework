require_relative('../db/crud.rb')

class Customer < Crud

  attr_reader :id, :name, :funds

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @funds = options['funds']
    # @discount = options['discount']  # discounts for cinema clud members
  end

  def change_name(newname)
    oldname = @name
    @name = newname
    return oldname
  end

  def buys_tickets(a_screening, number_of_tickets)
    tickets = Array.new
    number_of_tickets.times do
      @funds -= a_screening.price
      options = { 'screening_id' => a_screening.id ,
                  'customer_id' => @id,
                  'paid' => a_screening.price
      }
      tickets << Ticket.new(options).save
    end
    return tickets
  end

  def tickets()
    return self.tickets_for_customer
  end


end
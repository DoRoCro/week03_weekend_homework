require_relative('./film.rb')
class Screening < Crud

  attr_reader   :id, :film_id, :max_tickets
  attr_accessor :showtime ,:price

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @film_id = options['film_id']
    @showtime = options['showtime']
    @price = options['price']
    @max_tickets = options['max_tickets'].to_i
  end

  def film()
    return Film.find_by_id(@film_id)
  end

  def tickets()
    return self.tickets_for_screening
  end


end
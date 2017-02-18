require_relative('./film.rb')
class Screening < Crud

  attr_reader   :id, :film_id, :price
  attr_accessor :showtime

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @film_id = options['film_id']
    @showtime = options['showtime']
    @price = options['price']
  end



end
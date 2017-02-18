require_relative('../db/crud.rb')
class Film < Crud

  def initialize( options )
    @id = options['id'].to_i
    @name = options['title']
    @duration_mins = options['duration_mins']
  end

end
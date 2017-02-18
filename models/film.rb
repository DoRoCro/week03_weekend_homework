require_relative('../db/crud.rb')
class Film < Crud

  attr_reader :id
  
  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['title']
    @duration_mins = options['duration_mins']
  end

end
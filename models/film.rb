require_relative('../db/crud.rb')
class Film < Crud

  attr_reader :id, :title, :duration_mins

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @duration_mins = options['duration_mins']
  end

end
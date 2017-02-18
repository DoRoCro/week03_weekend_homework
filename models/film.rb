require_relative('../db/crud.rb')
class Film < Crud

  attr_reader :id, :title, :duration_mins

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @title = options['title']
    @duration_mins = options['duration_mins']
  end

  def change_title(new_title)
    # set function to avoid making @title generally accessible as this only needed for corrections
    old_title = @title
    @title = new_title
    return old_title
  end


end
require_relative('../db/crud.rb')
class Ticket < Crud

  attr_reader :id, :customer_id, :screening_id

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @customer_id = options['customer_id']
    @screening_id = options['screening_id']
  end

  def change_title(new_title)
    # set function to avoid making @title generally accessible as this only needed for corrections
    old_title = @title
    @title = new_title
    return old_title
  end


end
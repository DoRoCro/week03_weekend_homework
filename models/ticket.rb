require_relative('../db/crud.rb')
class Ticket < Crud

  attr_reader :id, :customer_id, :screening_id, :paid

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @customer_id = options['customer_id']
    @screening_id = options['screening_id']
    @paid = options['paid']
  end

  def change_customer(new_customer_id)
    # set function to avoid making @title generally accessible as this only needed for corrections
    old_customer_id = @customer_id
    @customer_id = new_customer_id
    return old_customer_id
  end


end
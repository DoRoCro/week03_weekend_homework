require_relative('../db/crud.rb')

class Customer < Crud

  attr_reader :id

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @funds = options['funds']
  end

end
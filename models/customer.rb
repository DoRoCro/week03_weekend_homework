# require_relative('../db/sql_runner.rb')
require_relative('../db/crud.rb')

class Customer < Crud

  def initialize( options )
    @id = options['id'].to_i
    @name = options['name']
    @funds = options['funds']
  end

end
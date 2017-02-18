require_relative('../db/crud.rb')

class Customer < Crud

  attr_reader :id, :name, :funds

  def initialize( options )
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @funds = options['funds']
  end

  def change_name(newname)
    oldname = @name
    @name = newname
    return oldname
  end
end
require_relative('../db/sql_runner.rb')
class Customer

  def initialize( options )
    @id = options['id'].to_i
    @name = options['name']
    @funds = options['funds']
  end



  def self.all()
    sql = "SELECT * FROM customers;"
    return self.get_many(sql)
  end

  def self.get_many(sql)
    return SqlRunner.get_many(sql, Customer)
  end

end
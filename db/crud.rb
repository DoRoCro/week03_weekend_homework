require_relative('./sql_runner.rb')

class Crud
  def self.get_caller()
    #stack overflow example how to get calling class, then can use to determine Class to return and derive table_name to query
    # assuming table nameing convention Class_type => 'class_types'
    self.class
  end
  def self.get_table_from_class()
    return self.to_s.downcase + "s"
  end


  def self.find_by_id(id)
    sql = "SELECT * FROM #{self.get_table_from_class} 
            WHERE id = #{id};"
    db_data = SqlRunner.run(sql)
    return self.new(db_data.first)
  end

  def self.all()
    # use SqlRunner.all method generic call all(class_type, table_name) deriving table_name from Class name
    return SqlRunner.all(self, self.to_s.downcase + "s")
  end

  def self.get_many(sql)
    # get_many method uses SqlRunnner equivalent passing required return class as parameter
    return SqlRunner.get_many(sql, self)
  end
end
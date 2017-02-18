require_relative('./sql_runner.rb')

class Crud


  def self.all()
    # use SqlRunner.all method generic call all(class_type, table_name) deriving table_name from Class name
    return SqlRunner.all(self, self.to_s.downcase + "s")
  end

  def self.get_many(sql)
    # get_many method uses SqlRunnner equivalent passing required return class as parameter
    return SqlRunner.get_many(sql, self)
  end
end
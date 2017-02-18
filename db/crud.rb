require_relative('./sql_runner.rb')

class Crud
  # def self.get_caller()
  #   #stack overflow example how to get calling class, then can use to determine Class to return and derive table_name to query
  #   # assuming table nameing convention Class_type => 'class_types'
  #   self.class
  # end
  
  def self.get_table_from_class()
    return self.to_s.downcase + "s"
  end

  def save()                                       
  # relies on all keys being strings matching column names
  # some horrible string handling...
    table_name = self.class.get_table_from_class
    variables = self.instance_variables           #returns array of symbols of form :@varname
    table_fields = ""
    values_list = ""
    variables.each do |x| 
      table_fields += x.to_s.delete("@") + ", " 
      # case instance_variable_get(x).class
      # when 'String'                                                      # this doesn't work even though in pry
      #   values_list += "'" + instance_variable_get(x).to_s + "', "       # instance_variable_get(x).class === 'String' is true...
      # else
      #   values_list += instance_variable_get(x).to_s + ", "
      # end
      if instance_variable_get(x).class == String
        values_list += "'" + instance_variable_get(x).to_s + "', "
      else
        values_list += instance_variable_get(x).to_s + ", "
      end
    end
    table_fields.chop!.chop!        # strip trailing comma from string
    values_list.chop!.chop!         # strip trailing comma from string
    
    sql = "INSERT INTO #{table_name} ( #{table_fields}) VALUES (#{values_list}) RETURNING * ;"
    db_data = SqlRunner.run(sql)
    return self.class.new(db_data.first)

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
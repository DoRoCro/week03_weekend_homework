require_relative('./sql_runner.rb')

class Crud

# # CREATE METHODS

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
    # create and run SQL string 
    sql = "INSERT INTO #{table_name} ( #{table_fields}) VALUES (#{values_list}) RETURNING * ;"
    db_data = SqlRunner.run(sql)
    @id = db_data.first['id'].to_i
    return self.class.new(db_data.first)
  end

# # RETRIEVE METHODS

  def self.find_by_id(id)
    sql = "SELECT * FROM #{self.get_table_from_class} 
            WHERE id = #{id};"
    db_data = SqlRunner.run(sql)
    return self.new(db_data.first)
  end

  def self.get_many(sql)
    result = SqlRunner.run(sql).map { |x| self.new(x)}
    return result
  end

  def self.all()
    sql = "SELECT * FROM #{self.get_table_from_class};"
    return self.get_many(sql)
  end


# # UPDATE METHODS

  def update()
    sql = "UPDATE #{get_table_from_class} SET"
    return 
  end


# # DELETE METHODS

  def self.delete_all()
    sql = "DELETE FROM #{self.get_table_from_class} ;"
    db_data = SqlRunner.run(sql)
  end


 # # Utility methods used by above

  def self.get_table_from_class()      # derive SQL tablename from Class name - assumes ruby "Class_type" => SQL "class_types" table
    return self.to_s.downcase + "s"
  end
end
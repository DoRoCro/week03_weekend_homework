require('pg')
require('logger')


class SqlRunner

  def self.run(sql)
    begin              # coping with errors from here on
      db = PG.connect( 
        { 
          dbname: 'cccinema', 
          host: 'localhost'
        }
      ) 
      result = db.exec(sql)
    rescue           # do something with any errors
      # do nothing today
    ensure           # even if an error, do the following
      db.close
    end
    # Log sql commands to a log file
    logger = Logger.new('sql.log')
    logger.info('SQL ' + sql + ' SQL')
    logger.close
    return result

  end

  def self.get_many(sql, class_type)
    db_data = SqlRunner.run(sql)
    result = db_data.map { |x| class_type.new(x)}
    return result
  end

  def self.all(class_type, table_name)
    sql = "SELECT * FROM #{table_name};"
    return self.get_many(sql, class_type)
  end

end
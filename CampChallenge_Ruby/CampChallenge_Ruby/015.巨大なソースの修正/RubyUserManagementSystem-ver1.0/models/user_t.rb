require 'mysql2'
class UserT
  def initialize(params)
    @params = params
    @client = Mysql2::Client.new(:host => 'localhost', :username => 'root', :password => '', :database => 'challenge_db')
    print("DB connected!")
  end

  def insert
    statement = @client.prepare(%q{insert into user_t(name,birthday,tell,type,comment,newDate) VALUES(?,?,?,?,?,?)})
    @result = statement.execute(@params["name"],@params["year"],@params["tell"],@params["type"],@params["comment"],DateTime.now)
  end
end

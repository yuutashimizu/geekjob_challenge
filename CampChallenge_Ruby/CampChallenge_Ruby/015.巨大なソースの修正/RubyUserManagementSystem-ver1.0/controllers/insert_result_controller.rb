require 'rack'
require '././models/user_t.rb'

# 入力パラメータをDBにinsertし、その結果を表示します。
class InsertResultController
  def call(env)

    request = Rack::Request.new(env)

    @params = request.session["insert_params"]

    # DBに入力パラメータをinsert
    user_t = UserT.new(@params)
    user_t.insert

    Rack::Response.new(render("insert_result.html.erb"))
  end

  def render(template)
    path = File.expand_path("../../views/#{template}", __FILE__)
        ERB.new(File.read(path)).result(binding)
  end
end

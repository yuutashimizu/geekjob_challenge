require 'rack'
require '././models/user_t.rb'

# 入力パラメータをDBにinsertし、その結果を表示します。
class InsertResultController
  def call(env)

    request = Rack::Request.new(env)

    params = request.params()

    # insert_confirmページからの遷移でないときはエラーページに飛ばす。正しいときはinsert_resultへ
    if params["secret"] == request.session["secret"]

      # DBに入力パラメータをinsert
      user_t = UserT.new(request.session["insert_params"])
      user_t.insert

      @view_params = user_t.view_helper

      Rack::Response.new(render("insert_result.html.erb"))
    else
      @error = "不正なアクセスルートです"

      Rack::Response.new(render("error.html.erb"))
    end
  end

  def render(template)
    path = File.expand_path("../../views/#{template}", __FILE__)
        ERB.new(File.read(path)).result(binding)
  end
end

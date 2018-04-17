require 'rack'

# 登録情報の確認を行う。入力が不足しているときは前のページに戻る
class InsertConfirmController
  def call(env)
    request = Rack::Request.new(env)

    # リクエスト情報からGETやPOSTで送られてきたデータをHashとして返す。
    @params = request.params()

    # insertページからの遷移でないときはエラーページに飛ばす。正しいときはinsert_confirmへ
    if @params["secret"] == request.session["secret"]
      # 入力パラメータをセッションに格納
      request.session["insert_params"] = @params

      # 入力パラメータが不完全かどうかを判別し、状態だけを返却
      if @params["name"].empty?
        @filled_flag = false
      else
        @filled_flag = true
      end

      Rack::Response.new(render("insert_confirm.html.erb"))
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

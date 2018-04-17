require 'rack'

#入力画面をコントロール。暗号を用意しておき、以降のページに直アクセスできないように
class InsertController
  def call(env)
    request = Rack::Request.new(env)

    #暗号を作成し、セッションに。この暗号をパラメータとして持ったPOSTじゃないと処理を受け付けないように
    @secret = Digest::SHA256.hexdigest(rand.to_s)
    request.session["secret"] = @secret

    Rack::Response.new(render("insert.html.erb"))
  end

  def render(template)
    path = File.expand_path("../../views/#{template}", __FILE__)
    ERB.new(File.read(path)).result(binding)
  end
end

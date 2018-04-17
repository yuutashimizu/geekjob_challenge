require 'rack'

class ResultDetailController
  def call(env)
    request = Rack::Request.new(env)

    params = request.params()

    user_t = UserT.new(params)
    @result_user = user_t.search_by_id
    
    Rack::Response.new(render("result_detail.html.erb"))
  end

  def render(template)
    path = File.expand_path("../../views/#{template}", __FILE__)
    ERB.new(File.read(path)).result(binding)
  end
end

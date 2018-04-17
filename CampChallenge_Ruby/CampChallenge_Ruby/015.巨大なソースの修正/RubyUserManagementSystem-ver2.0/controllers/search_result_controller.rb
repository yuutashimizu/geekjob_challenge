require 'rack'

class SearchResultController
  def call(env)
    request = Rack::Request.new(env)

    params = request.params()

    user_t = UserT.new(params)
    @result_users = user_t.search

    Rack::Response.new(render("search_result.html.erb"))
  end

  def render(template)
    path = File.expand_path("../../views/#{template}", __FILE__)
    ERB.new(File.read(path)).result(binding)
  end
end

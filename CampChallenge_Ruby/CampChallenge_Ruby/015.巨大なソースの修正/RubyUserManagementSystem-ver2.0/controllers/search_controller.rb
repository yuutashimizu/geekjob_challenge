require 'rack'

class SearchController
  def call(env)
    Rack::Response.new(render("search.html.erb"))
  end

  def render(template)
    path = File.expand_path("../../views/#{template}", __FILE__)
    ERB.new(File.read(path)).result(binding)
  end
end

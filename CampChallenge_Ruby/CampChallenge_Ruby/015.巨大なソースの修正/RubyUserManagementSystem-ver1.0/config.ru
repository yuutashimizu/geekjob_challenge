require './controllers/index_controller.rb'
require './controllers/insert_controller.rb'
require './controllers/insert_confirm_controller.rb'
require './controllers/insert_result_controller.rb'

use Rack::Reloader, 0

use Rack::Session::Cookie,
secret: Digest::SHA256.hexdigest(rand.to_s)

Encoding.default_external = 'UTF-8'

map "/" do
  run IndexController.new
end

map "/insert" do
  run InsertController.new
end

map "/insert_confirm" do
  run InsertConfirmController.new
end

map "/insert_result" do
  run InsertResultController.new
end

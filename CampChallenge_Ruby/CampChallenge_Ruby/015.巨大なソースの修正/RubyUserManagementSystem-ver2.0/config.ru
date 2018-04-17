require './controllers/index_controller.rb'
require './controllers/insert_controller.rb'
require './controllers/insert_confirm_controller.rb'
require './controllers/insert_result_controller.rb'
require './controllers/search_controller.rb'
require './controllers/search_result_controller.rb'
require './controllers/result_detail_controller.rb'
require './controllers/update_controller.rb'
require './controllers/update_result_controller.rb'

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

map "/search" do
  run SearchController.new
end

map "/search_result" do
  run SearchResultController.new
end

map "/result_detail" do
  run ResultDetailController.new
end

map "/update" do
  run UpdateController.new
end

map "/update_result" do
  run UpdateResultController.new
end

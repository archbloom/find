require_relative 'users_controller'
require_relative 'database'

# env request variable - passed to all the classes
# eg: to users controller's call will receive env

use Rack::Reloader
use Rack::Runtime
use Rack::ContentType, 'application/json'
use Rack::ContentLength

database = Database.new

map('/users') do
  run UsersController.new(database)
end
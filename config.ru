require_relative 'users_controller'
require_relative 'database'

# env request variable - passed to all the classes
# eg: to users controller's call will receive env

map('/users') do
  run UsersController.new
end
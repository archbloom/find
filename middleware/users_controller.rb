require 'json'

class UsersController

  def initialize(database)
    @database = database
  end

  def call(env)
    request = Rack::Request.new(env)
    response = Rack::Response.new
    response.headers['Content-Type'] = 'application/json'

    if request.path_info == ''
      if request.post?
        begin
          user = JSON.parse(request.body.read)
          if user['id'].nil?
            response.write('ID is required')
            response.status = 400
          else
            @database.add_user(user) # curl -X POST http://localhost:9292/users --data '{"id": 3, "name": "user three"}'
            response.write({ message: 'User Added!'})
          end
        rescue JSON::ParserError
          response.status = 400
          response.write({ message: 'Invalid JSON' })
        end
      else
        response.write(JSON.generate(@database.get_users))
      end
    elsif request.path_info =~ %r{/\d+}
      id = request.path_info.split('/').last.to_i
      user = @database.get_users(id)
      if user.empty?
        response.write({ message: 'User not found' })
      else
        response.write(JSON.generate(user))
      end
    else
      response.status = 404
      response.write({ message: 'Nothing to see here' })
    end

    response.finish
  end
end
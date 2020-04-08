require 'json'

class UsersController
  def call(env)
    request = Rack::Request.new(env)
    if env['PATH_INFO'] == ''
      if request.post?
        user = JSON.parse(request.body.read)
        Database.add_user(user) # curl -X POST http://localhost:9292/users --data '{"id": 3, "name": "user three"}'
        [200, {}, ['User added!']]
      else
        [200, {}, [Database.get_users.to_s]]
      end
    elsif env['PATH_INFO'] =~ %r{/\d+}
      id = env['PATH_INFO'].split('/').last.to_i
      [200, {}, [Database.get_users(id).to_s]]
    else
      [404, {}, ['Nothing to see here']]
    end
  end
end
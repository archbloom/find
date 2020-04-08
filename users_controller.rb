class UsersController
  def call(env)
    [200, {}, ['Hello from the Users Controller']]
  end
end
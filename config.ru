class Application

  def call(env)
    [200, {}, ['Hello from the Ruby web app using Rack']]
  end
end

run Application.new
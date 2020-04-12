### Ruby Web App using Rack

Just a sample Ruby based web application using Rack.

- 2 folders, same codebase for now
- each one has `config.ru` file
  - this is the rac file and the application runs from here
  - routes are written in this file
  - whenever there is a request for the route it searches here and redirects to `call` action of controller
- each folder one `users_controller`
  - has one `call` action
  - this `call` accepts an argument `env`
  - this `env` is environment has which all the information regarding the request
  - this handles the request and performs required operation

Learn more:

- [Rack GitHub](https://github.com/rack/rack)
- [Rack SPEC](https://www.rubydoc.info/github/rack/rack/file/SPEC)

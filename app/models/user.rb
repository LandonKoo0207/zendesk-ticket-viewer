class User < Flexirest::Base
  get :find, '/users/:id.json'
end
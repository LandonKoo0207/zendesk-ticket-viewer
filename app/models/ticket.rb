class Ticket < Flexirest::Base
  get :all, '/tickets.json'
  get :find, '/tickets/:id.json'
end
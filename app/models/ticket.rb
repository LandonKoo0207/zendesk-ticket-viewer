class Ticket < Flexirest::Base
  TICKETS_PER_PAGE = 25

  get :all, '/tickets.json', defaults: { page: 1, per_page: TICKETS_PER_PAGE, \
                                         sort_by: 'id', sort_order: 'desc' }
  get :find, '/tickets/:id.json'

  def self.total_ticket_count
    self.all.count
  end

  def self.page_count
    (self.all.count.to_f / TICKETS_PER_PAGE).ceil
  end
end
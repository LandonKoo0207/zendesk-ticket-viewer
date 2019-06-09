class TicketsController < ApplicationController
  def index
    @tickets = Ticket.all(page: params[:page])
    @page_count = Ticket.page_count
  end
end

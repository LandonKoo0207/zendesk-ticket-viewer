class TicketsController < ApplicationController

  def index
    @tickets = Ticket.all(page: params[:page]).tickets
    @page_count = Ticket.page_count
    @total_ticket_count = Ticket.total_ticket_count
  end

  def show
    @ticket = Ticket.find(params[:id]).ticket
    @requester = User.find(@ticket.requester_id)
  end
end

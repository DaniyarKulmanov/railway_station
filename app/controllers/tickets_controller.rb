class TicketsController < ApplicationController

  def show
  end

  def new
    @ticket = Ticket.new
  end

  def create
    render plain: params[:ticket].inspect
  end

end
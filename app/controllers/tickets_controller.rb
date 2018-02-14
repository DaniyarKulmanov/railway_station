class TicketsController < ApplicationController
  before_action :set_ticket, only: :show

  def show
  end

  def new # TODO update from :ticket?
    @ticket = Ticket.new
    @ticket.train_id = params[:ticket][:train_id] if params[:ticket][:train_id]
    @ticket.from_station_id = params[:ticket][:from_station_id] if params[:ticket][:from_station_id]
  end

  def create
    @ticket = Ticket.new(ticket_params)

    if @ticket.save
      redirect_to @ticket
    else
      render :new
    end
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def ticket_params
    params.require(:ticket).permit(
                                    :full_name,
                                    :passport_number,
                                    :train_id,
                                    :user_id,
                                    :to_station_id,
                                    :from_station_id,
                                    :ticket
                                  )
  end
end
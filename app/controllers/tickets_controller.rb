class TicketsController < ApplicationController

  def show
  end

  def new
    @ticket = Ticket.new
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

  def ticket_params
    params.require(:ticket).permit(
                                    :full_name,
                                    :passport_number,
                                    :train_id,
                                    :user_id,
                                    :to_station_id,
                                    :from_station_id
                                  )
  end
end
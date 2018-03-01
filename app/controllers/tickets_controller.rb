class TicketsController < ApplicationController
  before_action :authenticate_user!, only: :create
  before_action :set_ticket, only: [:show, :edit, :update, :destroy]

  def index
    @tickets = Ticket.all
  end

  def show; end

  def new
    @ticket = Ticket.new
    @ticket.train_id = params[:ticket][:train_id] if params[:ticket][:train_id]
    @ticket.from_station_id = params[:ticket][:from_station_id] if params[:ticket][:from_station_id]
    @ticket.to_station_id = params[:ticket][:to_station_id] if params[:ticket][:to_station_id]
  end

  def edit; end

  def create
    @ticket = current_user.tickets.new(ticket_params) # TODO fix error

    if @ticket.save
      redirect_to @ticket
    else
      redirect_to new_search_path
    end
  end

  def update
    if @ticket.update(ticket_params)
      redirect_to @ticket
    else
      render :edit
    end
  end

  def destroy
    @ticket.destroy
    redirect_to tickets_path
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
                                    :from_station_id,
                                    :to_station_id,
                                    :ticket
                                  )
  end
end
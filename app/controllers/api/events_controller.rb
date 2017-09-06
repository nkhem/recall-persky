require "byebug"
class Api::EventsController < ApplicationController
  def create
    # debugger
    begin
      @event = Event.new(event_params)
    rescue ActiveRecord::RecordInvalid => invalid
      render json: invalid.record.errors.full_messages, status: 404
    end

    if @event && @event.save
      # params[contiguousTimingsPairs].each contig_timing do
        # @event.create_shifts(params[:start_datetime], params[:end_datetime])
      # end

      # set organizer to current user
      render "api/events/show"
    end
  end

  def edit
  end

  def update
  end

  def destroy
  end

  private
  def event_params
    params.require(:newEvent).permit(:title, :street_address1, :street_address2, :city, :event_url, :img_url)

  end
end

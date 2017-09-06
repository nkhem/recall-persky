class Api::EventController < ApplicationController
  def create
    begin
      @event = Event.new(params[:newEvent])
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
end

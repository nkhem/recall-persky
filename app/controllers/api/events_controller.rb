class Api::EventController < ApplicationController
  def create
    begin
      @event = Event.new(event_params)
    rescue ActiveRecord::RecordInvalid => invalid
      render json: invalid.record.errors.full_messages, status: 404
    end

    if @event && @event.save
      # @event.create_shifts(start_datetime, end_datetime)
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
    params.require(:event).permit(
      :title,
      :street_address1,
      :street_address2,
      :city,
      :event_url,
      :img_url,
      :public_details,
      :private_notes
    )
  end
end

class MessagesController < ApplicationController
  before_action :set_room, only: %i[ show edit update destroy new create ]

  # GET /rooms/new
  def new
    @message = @room.messages.new
  end

  # POST /rooms
  def create
    @message = @room.messages.create!(message_params)

    respond_to do |format|
      format.turbo_stream
      format.html { redirect_to @room }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_room
      @room = Room.find(params[:room_id])
    end

    # Only allow a list of trusted parameters through.
    def message_params
      params.require(:message).permit(:content, :room_id)
    end
end

class Api::V1::BouncesController < ApplicationController
  def consume
    message = Message.new(params)
    IncomingProcessService.handle(message)

    render json: { message: 'OK' }, status: :ok
  end
end

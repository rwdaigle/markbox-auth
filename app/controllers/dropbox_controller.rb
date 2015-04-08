class DropboxController < ApplicationController

  skip_filter :verify_authenticity_token

  def verify_webhook
    render text: params[:challenge] || "No \"challenge\" parameter provided"
  end

  def webhook
    Scrolls.log(event: "db.delta", users: params[:delta][:users])
    head :ok
  end
end

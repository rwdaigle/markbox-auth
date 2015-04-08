class SessionsController < ApplicationController

  def new
    redirect_to(logged_in? ? root_path : dropbox_flow.start)
  end

  def establish
    access_token, user_id, url_state = dropbox_flow.finish(params)
    login(User.from_dropbox(user_id, access_token))
    redirect_to root_path
  end

  private

  def dropbox_flow
    @dropbox_flow ||= DropboxOAuth2Flow.new(DROPBOX_APP_KEY, DROPBOX_APP_KEY_SECRET,
      db_callback_url, session, :dropbox_auth_csrf_token)
  end
end

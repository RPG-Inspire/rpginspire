class OauthSessionsController < ApplicationController

  def twitter
    status, resource = Actions::Registration.register_from_oauth(auth_hash, helpers.topic_draft_id)
    if status == :success
      sign_in(:user, resource)
      helpers.erase_draft
      redirect_to :root, notice: I18n.t('devise.sessions.signed_in')
    else
      redirect_to :new_user_session, alert: 'Email is already registered but not linked to any twitter account.'
    end
  end

  protected

  def auth_hash
    request.env['omniauth.auth']
  end
end


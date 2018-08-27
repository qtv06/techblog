class SessionsController < ApplicationController
  def create
    begin
      user = User.from_omniauth(request.env['omniauth.auth'])
      flash[:success] = "Login success"
    rescue
      flash[:danger] = "Have error when authenticate account..."
    end
    redirect_to root_path
  end
end
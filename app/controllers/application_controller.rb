class ApplicationController < ActionController::Base
  skip_before_action :verify_authenticity_token

  def index
  end

  def show
    User.create!(name: params[:user][:name])
  end
end

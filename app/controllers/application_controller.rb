class ApplicationController < ActionController::Base
  before_action :set_authenticity_token

  def index
  end

  private
  
  def set_authenticity_token
    cookies["auth"] = { value: form_authenticity_token }
  end
end

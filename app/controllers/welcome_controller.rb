class WelcomeController < ApplicationController
	
  include WelcomeHelper
	before_action :local_redirect
  
  def index
  end
  
end

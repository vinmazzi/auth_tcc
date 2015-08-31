class WelcomeController < ApplicationController
  def index
  end
  def show
  end
  def login 
    teste = render plain params[:login].inspect    
  end
end

class LoginController < ApplicationController
   def new
   end

   def create 
  	render plain: params[:login].inspect 
   end
end

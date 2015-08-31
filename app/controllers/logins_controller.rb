class LoginsController < ApplicationController
   def new
	response.headers["Cache-Control"] = "no-cache, no-store, max-age=0, must-revalidate"
        response.headers["Pragma"] = "no-cache"
        response.headers["Expires"] = "Fri, 01 Jan 1990 00:00:00 GMT"

   end

   def create 
	teste = params[:login]
	login = teste["login"]
	senha = teste["pwd"]
	ip = request.remote_ip
	if(login == "teste" && senha == "vai")
		system("iptables -t nat -D PREROUTING 1")
		system("iptables -t nat -D PREROUTING 1")
		redirect_to :back
	end
	
   end
end

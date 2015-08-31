class LoginsController < ApplicationController
   def new
   end

   def create 
	teste = params[:login]
	login = teste["login"]
	senha = teste["pwd"]
	ip = request.remote_ip
	if(login == "vmazzi" && senha == "teste")
		system("iptables -t nat -I AUTH_TESTE -s #{ip}/32 -p tcp -j ACCEPT")
		#system("iptables -t nat -D PREROUTING 1")
		redirect_to :back
	end
	
   end
end

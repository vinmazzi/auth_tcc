require 'json'
class LoginsController < ApplicationController

   helper_method :cadastro_new

   def new
   end

   def cadastro
   end

   def cadastro_new
     cadastro = params[:cadastro]
     if(cadastro)
     	json = JSON.generate(params[:cadastro])
     	nome = cadastro["nome"]
     	sobrenome = cadastro["sobrenome"]
     	email = cadastro["email"]
     	cpf = cadastro["cpf"]
     	usuario = cadastro["username"]
     	senha = cadastro["pwd"]
     	render plain: json
     else
        redirect_to "/logins/cadastro"
     end 

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

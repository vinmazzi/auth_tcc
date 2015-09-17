require 'json'
require 'net/http'
class LoginsController < ApplicationController
   protect_from_forgery except: :new
   helper_method :cadastro_new

   def new
   end

   def cadastro
   end

   def cadastro_new
     cadastro = params[:cadastro]
     url = "http://localhost:3000/logins/teste"
     request = new XMLHttpRequest()
     if(cadastro)
     	json = JSON.generate(params[:cadastro])
     	nome = cadastro["nome"]
     	sobrenome = cadastro["sobrenome"]
     	email = cadastro["email"]
     	cpf = cadastro["cpf"]
     	usuario = cadastro["username"]
     	senha = cadastro["pwd"]
     	render plain: "code: #{resp.code}"
     else
        redirect_to "/logins/cadastro"
     end 

   end

   def libera 
	ip = request.remote_ip
	if(ip)
		system("iptables -t nat -I AUTH_TESTE -s #{ip}/32 -p tcp -j ACCEPT")
		#system("iptables -t nat -D PREROUTING 1")
		render plain: ip.inspect
	end
   end
end

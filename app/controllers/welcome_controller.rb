require 'oauth2'
require 'json'

class WelcomeController < ApplicationController

	before_action :authenticate_oauth2, except: :callback

	def index
		@user = current_user
	end

	def equipe
		year = params[:year].to_i
		if year == 0
			year = 2015
		end
		@team = []
		year_dir = "equipe/" + year.to_s + "-" + (year + 1).to_s 
	    filenames=Dir["app/assets/images/" + year_dir + "/*.png"].sort.reverse
		filenames.each do |filename|
			@team << { "image" => year_dir + "/" + File.basename(filename), "name" => File.basename(filename, ".png")}	
		end
  	end

  	def callback
	    set_oauth
	    if params[:error] != nil 
	        redirect_to "https://ares-ensiie.eu/"
	    else
	        access_token = @oauth.auth_code.get_token(params[:code], :redirect_uri => callback_url)
	        session[:access_token] = access_token.token
	        redirect_to root_path
	    end
  	end

  protected

  def set_oauth
    @oauth = OAuth2::Client.new(OAUTH_CONFIG['APP_ID'], OAUTH_CONFIG['APP_SECRET'], :site => OAUTH_CONFIG['OAUTH_PROVIDER'], :ssl => {:verify => false})
  end

  def authenticate_oauth2
  	if !signed_in?
	    set_oauth
	    if session[:access_token]
	      access_token = OAuth2::AccessToken.new(@oauth, session[:access_token])
	      begin
	        hash = JSON.parse(access_token.get("/api/v1/me.json").body)
			@user = User.from_OAuth2(hash)
			session[:user_id] = @user.id
	        return
	      rescue Exception => e
	        puts e.message
	      end
	    end
	    redirect_to @oauth.auth_code.authorize_url(:redirect_uri => callback_url)
	  end
	end
	
end

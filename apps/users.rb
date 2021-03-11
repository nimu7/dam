# frozen_string_literal: true

require 'sinatra/base'
require 'haml'

require_relative '../models/user'

module Users
  include Sinatra

  Base.enable :sessions

  Base.get '/signup' do
    haml :signup
  end

  Base.get '/signin' do
    haml :signin
  end

  Base.post '/signin' do
    user = User.where(name: params[:name]).first
    if user
      session[:user_id] = user._id
      redirect '/me'
    else
      redirect '/signin'
    end
  end

  Base.get '/signout' do
    redirect '/signin' unless session[:user_id]

    session[:user_id] = nil
    'see you!'
  end

  Base.post '/users' do
    user = User.new(name: params[:name])
    if user.save
      session[:user_id] = user._id
      redirect '/me'
    else
      redirect '/signup'
    end
  end

  Base.get '/me' do
    @user = User.where(_id: session[:user_id]).first

    redirect '/signup' unless @user

    haml :user_page
  end
end

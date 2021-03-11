# frozen_string_literal: true

# frozen_string_literal: true

require 'sinatra/base'
require 'haml'
require 'json'

require_relative '../models/user'
require_relative '../models/message'

module Messages
  include Sinatra

  Base.enable :sessions

  Base.get '/api/messages/random' do
    messages = []
    50.times do
      messages.append Message.random.first.as_document
    end

    messages.to_json
  end

  Base.post '/api/messages' do
    user = User.where(_id: session[:user_id]).first

    redirect '/signin' unless user

    message = Message.new(content: params[:content], user_id: user._id)
    message.save

    redirect '/'
  end
end

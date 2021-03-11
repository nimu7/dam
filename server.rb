# frozen_string_literal: true

require 'sinatra/base'
require 'mongoid'

require_relative './apps/users'
require_relative './apps/messages'

Mongoid.load!('./mongoid.yml')

class Server < Sinatra::Base
  include Users
  include Messages

  get '/' do
    haml :index
  end
end

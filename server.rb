# frozen_string_literal: true

require 'sinatra/base'
require 'mongoid'
require_relative './apps/users'

Mongoid.load!('./mongoid.yml')

class Server < Sinatra::Base
  include Users
end

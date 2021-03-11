# frozen_string_literal: true

require 'mongoid'
require_relative './user'

class Message
  include Mongoid::Document

  field :content
  field :user_id

  scope :random, -> { skip(rand(count)) }
end

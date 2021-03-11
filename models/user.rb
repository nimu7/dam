# frozen_string_literal: true

require 'mongoid'

class User
  include Mongoid::Document

  field :name

  validates :name, presence: true
  validates :name, uniqueness: true
end

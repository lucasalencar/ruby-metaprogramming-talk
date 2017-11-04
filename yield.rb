module Xunda

  module Config
    class << self
      attr_accessor :name
      attr_accessor :wtf_is_xunda
    end
  end

  def self.configure(&block)
    yield Config
  end
end


RSpec.configure do |config|
  config.name = 'hajshds'
end

require 'pry'; binding.pry

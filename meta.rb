Class.class_eval do
  def inherited(child)
    puts "[INHERITANCE] #{child.name} inheriting from #{name}"
  end

  def method_added(method)
    puts "[METHOD] Method #{method} added to #{name}"
    super
  end
end

Module.class_eval do
  def included(base)
    puts "[INCLUDE] including #{name} on #{base.name}"
  end

  def extended(object)
    puts "[EXTEND] Extending #{object.inspect} with #{name}"
  end
end

module Relatable
  def self.included(base)
    puts "including #{name} on #{base.name}"
  end

  def relatable?
    puts 'Sorry, you are not...'
  end

  def self.relate
    puts 'relating'
  end
end

class Person
  include Relatable

  class << self
    def count
      @count ||= 0
    end

    def count=(c)
      @count = c
    end
  end

  def count
    @count ||= 0
  end

  def count=(c)
    @count = c
  end

  private

  def pvt(msg)
    puts "Seu puto! #{msg}"
  end
end

person = Person.new

require 'pry'; binding.pry

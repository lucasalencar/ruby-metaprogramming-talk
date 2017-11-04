module Formatter
  class AbstractMethodError < StandardError; end

  class Base
    attr_accessor :content

    def initialize(content)
      @content = content
    end

    def to_html
      raise Formatter::AbstractMethodError
    end

    def self.inherited(child)
      type = child.name.split('::').last.downcase.to_sym
      Formatter::FORMATTERS[type] = child.name
    end
  end
end


module Formatter
  class UnknownFormatterError < StandardError; end

  FORMATTERS = {}

  def self.format(type, content)
    formatter_name = FORMATTERS[type.to_sym]
    raise UnknownFormatterError unless formatter_name

    formatter = eval(formatter_name)
    formatter.new(content).to_html
  end
end


require 'RedCloth'
require 'rdiscount'

module Formatter
  class Textile < Base
    def to_html
      RedCloth.new(@content).to_html
    end
  end

  class Markdown < Base
    def to_html
      RDiscount.new(@content).to_html
    end
  end
end

puts Formatter.format(:textile, 'h1. Isso é muito black mirror')
puts Formatter.format(:markdown, '# Isso é muito black mirror')


module Formatter
  class Xunda < Base
    def to_html
      "<h1>XUNDA!</h1>"
    end
  end
end

puts Formatter.format(:xunda, '# Isso é muito black mirror')

require 'pry'; binding.pry

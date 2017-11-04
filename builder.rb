require 'builder'

builder = Builder::XmlMarkup.new(:target=>STDOUT, :indent=>2)
xml = builder.person { |b| b.name("Jim"); b.phone("555-1234") }
puts xml

# Prints:
# <person>
#   <name>Jim</name>
#   <phone>555-1234</phone>
# </person>


module Builder
  class XmlBase
    # Create XML markup based on the name of the method.  This method
    # is never invoked directly, but is called for each markup method
    # in the markup block that isn't cached.
    def method_missing(sym, *args, &block)
      tag!(sym, *args, &block)
    end
  end
end

# https://github.com/jimweirich/builder/blob/master/lib/builder/xmlbase.rb#L88-L94

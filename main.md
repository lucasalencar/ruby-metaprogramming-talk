# Metaprogramming
*Isso é muito black mirror*

## WTF

* Software that writes Software
* Software that interacts with parts specific to the language (not
  business logic)

## WHY

* Build better and easier tools to use
* Useful when constructing tools/frameworks for developers
* Less likely used for business logic

## Object#send

* Executes a call to a method passing the given params.
* Great for dynamic method calling during exec time.
* Object#public_send

## yield

* Delegates part of your method to another context
* Good for flexible methods which can have many combinations
* Usually great for conditionals

## Kernel#eval

* Evaluates ruby code given inside a string
* I use it for running remote scripts in production

## Module#class_eval

* Same idea as Kernel#eval
* Changes the context inside eval to be inside the Module/Class it is
  called

## Ruby Hooks

* included, extended, inherited, method_added, method_missing
* Sort of rails hooks, but in Ruby and about language

### inherited example

### method_missing example

* https://github.com/jimweirich/builder

## Useful links

* http://howtocode.com.br/ebooks/ruby-metaprogramming
* http://yehudakatz.com/2009/11/15/metaprogramming-in-ruby-its-all-about-the-self/
* https://blog.codeship.com/metaprogramming-in-ruby/
* https://www.toptal.com/ruby/ruby-metaprogramming-cooler-than-it-sounds
* http://ruby-metaprogramming.rubylearning.com/

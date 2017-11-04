class SQL
  def select(fields)
    @select = fields
    self
  end

  def from(tables)
    @from = tables
    self
  end

  def where(conditions)
    @where = conditions
    self
  end

  def to_sql
    "".tap do |query|
      query << "SELECT #{@select} FROM #{@from}"
      query << " WHERE #{build_conditions}" if @where
    end
  end

  private

  def build_conditions
    @where.collect { |name, value| %[#{name} = "#{value}"] }.join(" AND ")
  end
end

sql = SQL.new
puts sql.select('*').from(:users).where({status: :ok}).to_sql

class MetaSQL
  %w[select from where limit].each do |method_name|
    class_eval <<-RUBY
      def #{method_name}(value)   # def select(value)
        @#{method_name} = value   #   @select = value
        self                      #   self
      end                         # end
    RUBY
  end

  def to_sql
    "".tap do |query|
      query << "SELECT #{@select} FROM #{@from}"
      query << " WHERE #{build_conditions}" if @where
      query << " LIMIT #{@limit}" if @limit
    end
  end

  private

  def build_conditions
    @where.collect { |name, value| %[#{name} = "#{value}"] }.join(" AND ")
  end
end

meta_sql = MetaSQL.new
puts meta_sql.select('*').from(:users).where({status: :ok}).limit(100).to_sql

require 'pry'; binding.pry

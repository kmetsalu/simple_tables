module SimpleTables
  class PivotTable < Hash
    def initialize
      self.default=0
    end

    def add_column(name,&block)
      added_columns[name]=block
      self
    end

    def added_columns
      @added_columns||=Hash.new
    end

    def column_headers(all=false)
      return ['#'] + self.keys.map{|k| k[0]}.uniq + added_columns.keys if all

      self.keys.map{|k| k[0]}.uniq
    end

    def row_headers
      self.map{|k,v| k[1]}.uniq
    end

    def rows
      result=[]
      row_headers.each do |rh|
        row = column_headers.map{|ch| self[[ch,rh]]}
        result << [rh] + row + added_columns.values.map{|v| v.call row }
      end

      result
    end

    def as_arrays
      result=[['#']+column_headers(true)]

      result << rows

      result
    end
  end
end
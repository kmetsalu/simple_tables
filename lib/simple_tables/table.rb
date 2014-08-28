module SimpleTables
  class Table
    attr_reader :data

    def initialize(data,col_names)
      @data=data.map{|r| Record.new(r,col_names)}
    end

    def where(conditions)
      @data.select { |r| r.matches?(conditions) }
    end

    def pivot(rows_col,cols_col,&block)
      result=@data.group_by{|r| [r[cols_col],r[rows_col]]}

      if block_given?
        return PivotTable[result.map{|k,v| [k,block.call(v)] }]
      end

      PivotTable[result.map{|k,v| [k,v.count]}]
    end
  end

  class Record
    def initialize(values,col_names)
      @data=Hash[col_names.zip(values)]
    end

    def [](key)
      @data[key]
    end

    def matches?(conditions)
      conditions.all? { |k,v| self[k] == v }
    end
  end
end
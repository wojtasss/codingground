class Matrix
    attr_reader :m_array
    attr_reader :m_rows
    attr_reader :m_cols
    
    def initialize(values_array, rows, cols=rows)
        @m_rows = rows
        @m_cols = cols
        @m_array = Array.new(rows) { Array.new(cols) }
        fill_m_array(values_array, rows, cols)
    end
    
    def fill_m_array(values_array, rows, cols)
        values_array.
            each_with_index do |value, i|
                @m_array[i/@m_cols][i%@m_rows] = value
            end
    end
    
    def display
        @m_array.
            each_with_index do |row, i|
                row.each_with_index do |value, j|
                    print "%5i" % [value]
                end
                puts
            end
    end
    
    def +(matrix)
        if matrix.m_rows == @m_rows && matrix.m_cols == @m_cols
            new_values_array = Array.new(@m_rows*@m_cols)
            new_values_array.
                each_with_index do |value, i|
                    value = matrix.m_array[i/@m_cols][i/@m_rows] +
                                @m_array[i/@m_cols][i/@m_rows]
                end
            Matrix.new(new_values_array, @m_rows, @m_cols)
        else
            puts "Both matrixes should be this same size!"
        end
    end
end

m1 = Matrix.new([1,2,3,4], 2)
m2 = Matrix.new([1,2,3,4], 2)
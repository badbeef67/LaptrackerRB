class Track
    attr_accessor :name, :length
    
    def initialize(name,length)
        @name = name
        @length = length.to_f
    end

end

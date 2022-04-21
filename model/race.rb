class Race
    attr_accessor :starttime, :duration_laps, :duration_minutes

    def initialize
        @duration_laps = 0
        @duration_minutes = 0
    end

    def set_start_time
        @starttime = Time.now
    end

    def set_duration_laps(lapcount)
        @duration_laps = lapcount.to_i
    end

    def set_duration_minutes(minutes)
        @duration_minutes = minutes.to_i
    end

end
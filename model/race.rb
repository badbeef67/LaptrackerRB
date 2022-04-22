class Race
    attr_accessor :flag, :starttime, :startmono, :duration_laps, :duration_minutes, :endmono

    def initialize
        @duration_laps = 0
        @duration_minutes = 0
        @flag = "Yellow"
    end

    def set_start_time
        @starttime = Time.now
        @startmono = Process.clock_gettime(Process::CLOCK_MONOTONIC)
        @endmono = @duration_minutes * 60 + @startmono if @duration_minutes
    end

    def set_duration_laps(lapcount)
        if lapcount == "0"
            @duration_minutes = 0
        else
            @duration_minutes = nil
        end
        @duration_laps = lapcount.to_i
    end

    def set_duration_minutes(minutes)
        if minutes == "0"
            @duration_laps = 0
        else
            @duration_laps = nil
        end
        @duration_minutes = minutes.to_f
    end
end
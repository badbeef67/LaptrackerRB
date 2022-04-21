class Telemetry
    attr_accessor :lc, :lt, :ft, :mph, :fmph, :lstart
    
    def initialize
        @lc = 0
        @lt = 0
        @ft = 0
        @mph = 0
        @fmph = 0
        #some arbitrary large number for sorting
        @lstart = 2**64
    end

    def add_lap(track)
        if @lstart == 2**64
            @lstart = Process.clock_gettime(Process::CLOCK_MONOTONIC)
        else
            @lc += 1
            self.add_lt
            self.check_ft
            self.calc_mph(track)
        end
    end

    def add_lt
        lap_end = Process.clock_gettime(Process::CLOCK_MONOTONIC)
        @lt = sprintf("%2.3f", lap_end - @lstart).to_f
        @lstart = lap_end
    end

    def check_ft
        @ft == 0 || @lt < @ft ? @ft = @lt : return
    end

    def calc_mph(track)
        @mph = sprintf("%3.2f", (track.length/5280) / (@lt/3600))
        self.check_fmph
    end

    def check_fmph
        if @fmph == 0
            @fmph = @mph.to_f
        elsif @mph.to_f > @fmph.to_f
            @fmph = @mph.to_f
        end
    end

end
require_relative '../model/track'
require_relative '../model/race'
require_relative '../model/racer'
require_relative '../model/telemetry'
require_relative '../view/viewer'

class RaceControl
    attr_accessor :track, :race, :racers

    def initialize
        @racers = []
        @viewer = Viewer.new
        @race = Race.new
    end

    def clear_error
        @viewer.error = ""
    end

    def add_track(name,length)
        @track = Track.new(name,length)
    end

    def add_racer(name,key)
        racer = Racer.new(name,key)
        racer.telemetry = Telemetry.new
        @racers.push(racer)
        @racers.uniq!(&:name)
    end

    def add_race_laps(laps)
        @race.set_duration_laps(laps)
    end

    def add_race_minutes(minutes)
        @race.set_duration_minutes(minutes)
    end

    def delete_racer(name)
        @racers.reject! {|racer| racer.name == name}
    end

    def main_menu
        @viewer.clear_screen
        @viewer.main_menu
    end

    def option1
        @viewer.option1(@racers)
    end

    def option1_racer_name
        @viewer.option1_racer_name
    end

    def option1_racer_key
        @viewer.option1_racer_key
    end

    def option2
        @viewer.option2(@track)
    end

    def option2_track_name
        @viewer.option2_track_name
    end

    def option2_track_length
        @viewer.option2_track_length
    end

    def option3
        @viewer.option3(@race)
    end

    def option3_duration_laps
        @viewer.option3_duration_laps
    end

    def option3_duration_minutes
        @viewer.option3_duration_minutes
    end

    def pre_race
        if @racers.empty?
            @viewer.pre_race_racers_empty
            false
        elsif @track == nil
            @viewer.pre_race_track_nil
            false
        else
            true
        end
    end

    def match_key(char)
        @racers.select {|racer| racer.key == char}.empty? ? false : true
    end

    def race_remaining_laps(char)
        return true if @race.duration_laps == 0
        racer = @racers.select {|racer| racer.key == char}[0]
        racer.telemetry.lc < @race.duration_laps ? true : false
    end

    def race_winner
        @viewer.print_race_winner(@racers)
    end

    def race_start
        @race.set_start_time
        @viewer.print_race_start(@racers)
    end

    def race_pause
        @viewer.print_race_pause(@racers)
    end

    def race_update
        #check here for race_durations
        @viewer.print_race(@racers)
    end

    def new_telemetry
        @racers.each {|racer| racer.telemetry = Telemetry.new}
    end

    def add_lap(char)
        @racers.select {|racer| racer.key == char}[0].telemetry.add_lap(@track)
    end

end
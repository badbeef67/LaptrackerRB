require_relative '../controller/racecontrol'
require 'io/console'

class Mainmenu

    def initialize
        @racecontrol = RaceControl.new
        loop do
            @racecontrol.main_menu
            char = STDIN.getch
            case 
                when char == '0'
                    break
                when char == '1'
                    self.option1
                when char == '2'
                    self.option2
                when char == '3'
                    self.option3
                when char == '4'
                    self.option4 if @racecontrol.pre_race
            end
        end
    end

    def option1
        loop do
            @racecontrol.option1
            char = STDIN.getch
            case 
                when char == '0'
                    @racecontrol.clear_error
                    break
                when char == '1'
                    @racecontrol.option1_racer_name
                    name = gets.chomp
                    @racecontrol.option1_racer_key
                    key = STDIN.getch
                    @racecontrol.add_racer(name,key)
                when char == '2'
                    @racecontrol.option1_racer_name
                    name = gets.chomp
                    @racecontrol.delete_racer(name)
            end
        end
    end

    def option2
        loop do
            @racecontrol.option2
            char = STDIN.getch
            case 
                when char == '0'
                    @racecontrol.clear_error
                    break
                when char == '1'
                    @racecontrol.option2_track_name
                    name = gets.chomp
                    @racecontrol.option2_track_length
                    length = gets.chomp
                    @racecontrol.add_track(name, length)
            end
        end
    end

    def option3
        loop do
            @racecontrol.option3
            char = STDIN.getch
            case 
                when char == '0'
                    @racecontrol.clear_error
                    break
                when char == '1'
                    @racecontrol.option3_duration_laps
                    laps = gets.chomp
                    @racecontrol.add_race_laps(laps)
                when char == '2'
                    @racecontrol.option3_duration_minutes
                    minutes = gets.chomp
                    @racecontrol.add_race_minutes(minutes)
            end
        end
    end

    def option4
        @racecontrol.race_start
        loop do
            char = STDIN.getch
            key_match = @racecontrol.match_key(char)
            case
                when char == 'q'
                    break
                when char == 'p'
                    @racecontrol.race_pause
                    sleep(0.25) until STDIN.getch == "p"
                when key_match == true
                    @racecontrol.add_lap(char) if @racecontrol.race_remaining_laps(char)
                else
                    racer = @racecontrol.add_racer(char,char)
                    @racecontrol.add_lap(char)
            end
            @racecontrol.race_update
        end
        @racecontrol.new_telemetry
    end

end

@menu_obj = Mainmenu.new
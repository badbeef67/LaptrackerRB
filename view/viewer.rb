class Viewer
    attr_accessor :error

    def initialize
        @error = ""
    end

    def clear_screen
        system "cls"
    end

    def main_menu
        printf("[1] Racers\n[2] Track\n[3] Duration\n[4] Start race\n\n[0] Quit and exit\nSelect option:\n\n#{@error}")
    end

    def option1(racers)
        self.clear_screen
        printf("Current registered racers:\n")
        racers.size == 0 ? printf("\tnone\n") : racers.each {|r| printf("\t#{r.name}: #{r.key}\n")}
        printf("[1] Add new racer\n[2] Remove racer\n[0] Return to main menu\n")
    end

    def option1_racer_name
        self.clear_screen
        printf("Racer name: ")
    end

    def option1_racer_key
        self.clear_screen
        printf("Racer key: ")
    end

    def option2(track)
        self.clear_screen
        printf("Current registered track:\n")
        track ? printf("\t#{track.name}: #{track.length}\n") : printf("\tNone\n")
        printf("[1] Add or change track\n[0] Return to main menu")
    end

    def option2_track_name
        self.clear_screen
        printf("Track name: ")
    end

    def option2_track_length
        printf("Track length feet: ")
    end

    def option3(race)
        self.clear_screen
        printf("Current race duration setting:\n")
        race ? printf("\tLaps: #{race.duration_laps}\n\tMinutes: #{race.duration_minutes}\n") : printf("\tNone\n")
        printf("[1] Laps\n[2] Minutes\n[0] Return to main menu")
    end

    def option3_duration_laps
        self.clear_screen
        printf("Number of Laps: ")
    end

    def option3_duration_minutes
        self.clear_screen
        printf("Minutes to run: ")
    end

    def pre_race_racers_empty
        @error = "Please add one or more racers to begin race!"
    end

    def pre_race_track_nil
        @error = "Please add a track to begin race!"
    end

    def print_race_header
        self.clear_screen
        sep = "+-#{'-'*10}-+-#{'-'*10}-+-#{'-'*10}-+-#{'-'*10}-++-#{'-'*10}-+-#{'-'*10}-++\n"
        printf(sep)
        printf("| %10.10s | %10.10s | %10.10s | %10.10s || %10.10s | %10.10s ||\n", "RACER", "LC", "LT", "MPH", "FT", "FMPH")
        printf(sep)
    end

    def print_race_start(racers, flag)
        self.print_race_header
        racers.sort_by! {|racer| racer.name}
        racers.each {|racer| printf("| %10.10s | %10.10s | %10.10s | %10.10s || %10.10s | %10.10s ||\n", racer.name, " ", " ", " ", " ", " ") }
        self.print_race_footer('race', flag)
    end

    def print_race_pause(racers, flag)
        self.print_race_header
        racers.sort_by! {|racer| [racer.telemetry.lc,-racer.telemetry.lstart * -1]}.reverse!
        racers.each {|racer| printf("| %10.10s | %10.10s | %10.10s | %10.10s || %10.10s | %10.10s ||\n", racer.name, racer.telemetry.lc, racer.telemetry.lt, racer.telemetry.mph, racer.telemetry.ft,racer.telemetry.fmph) }
        self.print_race_footer('pause', flag)
    end

    def print_race(racers, flag)
        self.print_race_header
        racers.sort_by! {|racer| [racer.telemetry.lc,racer.telemetry.lstart * -1]}.reverse!
        racers.each {|racer| printf("| %10.10s | %10.10s | %10.10s | %10.10s || %10.10s | %10.10s ||\n", racer.name, racer.telemetry.lc, racer.telemetry.lt, racer.telemetry.mph, racer.telemetry.ft,racer.telemetry.fmph) }
        self.print_race_footer('running', flag)
    end

    #def print_race_winner(racers,flag)
    #    self.print_race_header
    #    racers.sort_by! {|racer| [racer.telemetry.lc,racer.telemetry.lstart * -1]}.reverse!
    #    racers.each {|racer| printf("| %10.10s | %10.10s | %10.10s | %10.10s || %10.10s | %10.10s ||\n", racer.name, racer.telemetry.lc, racer.telemetry.lt, racer.telemetry.mph, racer.telemetry.ft,racer.telemetry.fmph) }
    #    self.print_race_footer('winner', flag)
    #end
    
    def print_race_footer(update,flag)
        sep = "+-#{'-'*10}-+-#{'-'*10}-+-#{'-'*10}-+-#{'-'*10}-++-#{'-'*10}-+-#{'-'*10}-++\n"
        printf(sep)
        printf("Flag: #{flag}")
        case update
            when "running"
                printf("\nPress 'q' to exit or 'p' to pause:")
            when "pause"
                printf("\n\nRace paused! Press 'p' to unpause")
        end
    end
end
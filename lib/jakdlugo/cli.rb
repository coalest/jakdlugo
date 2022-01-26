require_relative 'course_data'

module Jakdlugo
  class CLI
    def initialize
      @app = CourseData.new
    end

    def start(args)
      subcommand, first_arg, second_arg = args.map(&:downcase)

      case subcommand
      when '-c', '--course'   then @app.course_summary(first_arg)
      when '-t', '--track'    then @app.track_summary(first_arg)
      when '-p', '--progress' then @app.progress_summary(first_arg, second_arg)
      else display_help_message
      end
    end

    private

    def display_help_message
      puts <<~HEREDOC
        A command line tool to estimate how long courses at Launch School
        will take.

        Commands:

        -c, --course [COURSE]           :Show data about a specific course
        -t, --track [TRACK]             :Show data about ruby or javascript track
        -p, --progress [TRACK] [COURSE] :Show your progress to finishing Core
      HEREDOC
    end
  end
end

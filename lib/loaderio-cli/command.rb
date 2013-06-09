module LoaderioCLI
  class Command
    class << self
      def run(args = [])
        case args[0]
        when 'apps'
          App.run args
        when 'tests'
          Test.run args
        else
          help
        end
      end

      def help
        "loaderio-cli v#{LoaderioCLI::VERSION}\n\n" +
        "Usage:\n\n $ loaderio [command] [params]\n\n" +
        "  help                      Shows list of commands\n\n" +
        "Applications\n\n" +
        "  apps                      Shows list of user apps\n" +
        "  apps create [app name]    Create new app with given name\n" +
        "  apps verify [app id]      Verifies app with given id\n\n" +
        "Tests\n\n" +
        "  tests                     Shows list of user tests\n\n" +
        #"  tests stop [test id]      Stops a test\n\n" +
        #"Results\n\n" +
        #"  results show [app id]     Shows test results" +
        "\n\n"
      end
    end
  end
end

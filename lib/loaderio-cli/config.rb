module LoaderioCLI
  class Config
    class << self
      def exists?
        File.exists? path
      end

      def load
        @options = YAML.load_file path
        Loaderio::Configuration.api_key = @options['api_key']
      end

      def options
        @options
      end

      def create
        File.open(path, "w") do |file|
          YAML.dump default_options, file
        end
      end

      def info
        "New config has been created in ~/.loaderio-cli\n" +
        "Please fill there your token."
      end

      def path
        "#{Dir.home}/.loaderio-cli"
      end

      def default_options
        @default_options ||= {
          'api_key' => 'PUT_TOKEN_HERE'
        }
      end
    end
  end
end

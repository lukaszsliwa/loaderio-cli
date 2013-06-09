module LoaderioCLI
  class App
    class << self
      def run(args = [])
        name = args[1]
        name = 'all' unless name.present?
        if %w{all create verify}.include? name
          method(name).call(args)
        else
          "Wrong command: #{name}"
        end
      end

      def all(args = [])
        Loaderio::Application.all.map do |application|
          ['  ', application.app_id, application.status, application.app].join '  '
        end.join "\n"
      end

      def create(args = [])
        if (app_name = args[2]).present?
          Loaderio::Application.create :app => app_name
          'Done.'
        else
          'Please provide an application name: apps create [app name]'
        end
      end

      def verify(args = [])
        if (app_id = args[2]).present?
          Loaderio::Application.verify app_id
          'Done.'
        else
          'Please provide an application id: apps verify [app id]'
        end
      end
    end
  end
end

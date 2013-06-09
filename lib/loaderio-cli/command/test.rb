module LoaderioCLI
  class Test
    class << self
      def run(args = [])
        name = args[1]
        name = 'all' unless name.present?
        if %w{all}.include? name
          method(name).call(args)
        else
          "Wrong command: #{name}"
        end
      end

      def all(args = [])
        Loaderio::Test.all.map do |test|
          [test.test_id, test.name, "(#{test.status})", "\n"].join(' ') +
          ['   ', test.request_type, test.url, "\n"].join(' ') +
          ['   ', 'Duration:', test.duration, "\n"].join(' ') +
          ['   ', 'Timeout: ', test.timeout, "\n"].join(' ') +
          ['   ', 'From:    ', test.from, "\n"].join(' ') +
          ['   ', 'To:      ', test.to].join(' ')
        end.join "\n\n"
      end
    end
  end
end

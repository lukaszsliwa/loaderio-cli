module LoaderioCLI
  class CLI
    def self.run
      if Config.exists?
        Config.load
        $stdout.puts Command.run(ARGV)
      else
        Config.create
        $stdout.puts Config.info
      end
    end
  end
end

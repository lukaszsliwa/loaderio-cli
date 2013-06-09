require 'spec_helper'

describe LoaderioCLI::CLI do
  before do
    $stdout.stubs :puts
  end
  describe '.run' do
    context 'when config exists' do
      before do
        LoaderioCLI::Config.expects(:exists?).returns true
      end
      it 'should load config and run a command' do
        LoaderioCLI::Config.expects(:load)
        LoaderioCLI::Command.expects(:run)
        LoaderioCLI::CLI.run
      end
    end
    context 'when config does not exist' do
      before do
        LoaderioCLI::Config.expects(:exists?).returns false
      end
      it 'should create config and print info' do
        LoaderioCLI::Config.expects(:create)
        LoaderioCLI::Config.expects(:info)
        LoaderioCLI::CLI.run
      end
    end
  end
end

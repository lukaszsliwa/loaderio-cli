require 'spec_helper'

describe LoaderioCLI::App do
  describe '.run' do
    context 'when name is empty' do
      it 'should call all' do
        LoaderioCLI::App.expects(:all).once
        LoaderioCLI::App.run %w{apps}
      end
    end
    context 'when name contains incorrect argument' do
      it 'should returns "Wrong command: xxx"' do
        LoaderioCLI::App.run(%w{apps xxx}).should eql 'Wrong command: xxx'
      end
    end
  end
  describe '.all' do
    before do
      all = []
      3.times { all << Loaderio::Application.new(:app_id => 1, :status => 'verified', :app => 'Test') }
      Loaderio::Application.stubs(:all).returns all
    end
    it 'should return string' do
      LoaderioCLI::App.all(['apps', 'all']).should eql "    1  verified  Test\n    1  verified  Test\n    1  verified  Test"
    end
  end
  describe '.create' do
    context 'when argument is incorrect' do
      it 'should create new app' do
        Loaderio::Application.expects(:create).never
        LoaderioCLI::App.create(%w{apps create}).should eql 'Please provide an application name: apps create [app name]'
      end
    end
    context 'when argument is correct' do
      before do
        ARGV[2] = 'App Name'
      end
      it 'should create new app' do
        Loaderio::Application.expects(:create).with(:app => 'App Name').once
        LoaderioCLI::App.create ['apps', 'create', 'App Name']
      end
    end
  end
  describe '.verify' do
    context 'when arguments are correct' do
      it 'should create new app' do
        Loaderio::Application.expects(:verify).with('1').once
        LoaderioCLI::App.verify %w{apps verify 1}
      end
    end
    context 'when arguments are incorrect' do
      it 'should return a message' do
        Loaderio::Application.expects(:verify).never
        LoaderioCLI::App.verify(%w{apps verify}).should eql 'Please provide an application id: apps verify [app id]'
      end
    end
  end
end

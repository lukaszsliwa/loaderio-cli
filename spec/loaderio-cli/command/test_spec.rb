require 'spec_helper'

describe LoaderioCLI::Test do
  describe '.run' do
    context 'when arguments are correct' do
      it 'should run a method' do
        LoaderioCLI::Test.expects(:all).once
        LoaderioCLI::Test.run(%w{tests})
      end
    end
    context 'when arguments are incorrect' do
      it 'should return "Wrong command: xxx"' do
        LoaderioCLI::Test.run(%w{tests xxx}).should eql 'Wrong command: xxx'
      end
    end
  end
  describe '.all' do
    before do
      all = []
      3.times do
        all << Loaderio::Test.new(:test_id => 1, :name => 'Test Name', :status => 'completed',
                                  :request_type => 'POST', :url => 'http://apptamers.com', :duration => 1000,
                                  :timeout => 60, :from => 0, :to => 250)
      end
      Loaderio::Test.stubs(:all).returns all
    end
    it 'should return a string' do
      LoaderioCLI::Test.all.should eql "1 Test Name (completed) \n    POST http://apptamers.com \n    Duration: 1000 \n    Timeout:  60 \n    From:     0 \n    To:       250\n\n1 Test Name (completed) \n    POST http://apptamers.com \n    Duration: 1000 \n    Timeout:  60 \n    From:     0 \n    To:       250\n\n1 Test Name (completed) \n    POST http://apptamers.com \n    Duration: 1000 \n    Timeout:  60 \n    From:     0 \n    To:       250"
    end
  end
end

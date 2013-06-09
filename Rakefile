# encoding: utf-8

lib = File.expand_path('../lib/', __FILE__)
$:.unshift lib unless $:.include?(lib)
require "loaderio-cli/version"

require 'rubygems'
require 'bundler'
begin
  Bundler.setup(:default, :development)
rescue Bundler::BundlerError => e
  $stderr.puts e.message
  $stderr.puts "Run `bundle install` to install missing gems"
  exit e.status_code
end
require 'rake'

require 'jeweler'
Jeweler::Tasks.new do |gem|
  # gem is a Gem::Specification... see http://docs.rubygems.org/read/chapter/20 for more options
  gem.name = "loaderio-cli"
  gem.homepage = "http://github.com/lukaszsliwa/loaderio-cli"
  gem.license = "MIT"
  gem.summary = %Q{Loader.io CLI}
  gem.description = %Q{Loader.io is a service which provides possibility to test your application against 50k concurrent connections. This gem makes you easy to manage your tests by console.}
  gem.email = "lukasz.sliwa@apptamers.com"
  gem.authors = ["Łukasz Śliwa"]
  gem.executables = %w{loaderio loaderiocli loaderio-cli}
  # dependencies defined in Gemfile
  gem.version = LoaderioCLI::VERSION
  gem.require_paths = ["lib"]
  gem.files = Dir.glob("{bin,lib}/**/*") + %w(LICENSE README.rdoc)
end
Jeweler::RubygemsDotOrgTasks.new

require 'rspec/core'
require 'rspec/core/rake_task'
RSpec::Core::RakeTask.new(:spec) do |spec|
  spec.pattern = FileList['spec/**/*_spec.rb']
end

RSpec::Core::RakeTask.new(:rcov) do |spec|
  spec.pattern = 'spec/**/*_spec.rb'
  spec.rcov = true
end

task :default => :spec

require 'rdoc/task'
Rake::RDocTask.new do |rdoc|
  version = LoaderioCLI::VERSION

  rdoc.rdoc_dir = 'rdoc'
  rdoc.title = "loaderio-cli #{version}"
  rdoc.rdoc_files.include('README*')
  rdoc.rdoc_files.include('lib/**/*.rb')
end

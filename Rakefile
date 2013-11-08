$LOAD_PATH << File.expand_path("../lib/", __FILE__)
require "bundler/gem_tasks"
require 'rake/testtask'
require 'rodzilla'

namespace :gem do
    
    desc "Build the rodzilla gem"
    task :build do
        %(gem build rodzilla.gemspec )
    end

    desc "Install the rodzilla gem"
    task :install => :build do
        %(gem install rodzilla-#{Rodzilla::VERSION::STRING}.gem)
    end

    desc "Release the rodzilla gem"
    task :release => :build do
        %(gem push rodzilla-#{Rodzilla::VERSION::STRING}.gem)
    end

    desc "Clean-up the rodzilla directory"
    task :cleanup do
       gems = Dir["*.gem"]
       gems.map { |g| File.unlink(g) } unless gems.empty?
    end
end


desc 'Default: run unit tests.'
task default: :test

desc 'Test the rodzilla client.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib' << 'test'
  t.test_files = FileList['test/**/*_test.rb']
  t.verbose = true
end

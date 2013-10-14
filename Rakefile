require "bundler/gem_tasks"
require 'rake/testtask'

desc 'Default: run unit tests.'
task default: :test

desc 'Test the rodzilla client.'
Rake::TestTask.new(:test) do |t|
  t.libs << 'lib' << 'test'
  t.test_files = FileList['test/**/*_test.rb']
  t.verbose = true
end
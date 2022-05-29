require 'bundler/setup'
require 'rake/testtask'
require 'rubocop/rake_task'

task :package do 
  `rm -rf dist`
  `rm -rf build`

  `bundle check --path vendor/bundle > /dev/null 2>&1`
  `bundle config --local path 'vendor/bundle' --without development test` 
  `bundle install`
end

namespace :test do
  desc 'Run all tests'
  Rake::TestTask.new(:all) do |t|
    t.libs << 'spec'
    t.test_files = FileList['spec/**/*_spec.rb']
    t.verbose = true
  end
end

namespace :rubocop do
  desc 'Run RuboCop on all files'
  RuboCop::RakeTask.new(:all) do |t|
    t.patterns = ['**/*.rb']
    t.formatters = ['clang']
    t.fail_on_error = true
    t.options = ['./.rubocop.yml']
  end

  desc 'Fix RuboCop offenses'
  RuboCop::RakeTask.new(:fix) do |t|
    t.patterns = ['**/*.rb']
    t.formatters = ['clang']
    t.fail_on_error = true
    t.options = ['--auto-correct-all', './.rubocop.yml']
  end
end
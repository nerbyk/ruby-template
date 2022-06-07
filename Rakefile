require 'bundler/setup'
require 'rake/testtask'

begin
  desc 'Run all tests'
  Rake::TestTask.new(:test) do |t|
    t.libs << 'spec'
    t.test_files = FileList['spec/**/*_spec.rb']
    t.verbose = true
  end
rescue LoadError
  task(:test) {}
end

begin
  require 'rubocop/rake_task'

  desc 'Run RuboCop on all files'
  RuboCop::RakeTask.new do |t|
    t.patterns = ['**/*.rb']
    t.formatters = ['clang']
    t.fail_on_error = true
    t.options = ['./.rubocop.yml']
  end

  desc 'Run RuboCop on new git files'
  RuboCop::RakeTask.new("rubocop:new") do |t|
    t.formatters = ['clang']
    t.fail_on_error = true
    t.options = ['./.rubocop.yml']
    t.patterns = `git diff --cached --name-only --diff-filter=A -- *.rb`.split("\n")
  end
rescue LoadError
  task(:rubocop) {}
  task("rubocop:new"){}
end

task :steep do
  require 'steep'
  require 'steep/cli'

  Steep::CLI.new(argv: ["check"], stdout: $stdout, stderr: $stderr, stdin: $stdin).run
end

namespace :steep do
  task :stats do
    exec %q(bundle exec steep stats --log-level=fatal --format=table')
  end
end

task default: %w[steep rubocop test]

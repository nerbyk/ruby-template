# frozen_string_literal: true
require "bundler/setup"

require "minitest/autorun"
require "minitest/reporters"

Dir["./src/**/*.rb"].each { |file| require file }

Minitest::Reporters.use! [Minitest::Reporters::SpecReporter.new(color: true)]

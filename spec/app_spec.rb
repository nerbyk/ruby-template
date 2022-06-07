# frozen_string_literal: true

require 'test_helper'
require './lib/app'

describe AppName::Handlers do
  describe '#process' do
    it 'returns a greeting' do
      event = { 'data' => { 'name' => 'World' } }
      assert_equal 'Hello, World, I\'m from AppName::Handlers', AppName::Handlers.process(event: event)
    end
  end
end

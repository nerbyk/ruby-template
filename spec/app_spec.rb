require 'test_helper'
require './lib/app'

describe App::Handler do
  describe '#process' do
    it 'returns a greeting' do
      event = { 'data' => { 'name' => 'World' } }
      assert_equal 'Hello, World, I\'m from App::Handler', App::Handler.process(event: event)
    end
  end
end

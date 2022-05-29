# frozen_literal: true

module App
  class Handler
    def self.process(event:)
      "Hello, #{event['data']['name']}, I'm from #{name}"
    end
  end
end

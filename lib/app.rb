# frozen_string_literal: true

# frozen_literal: true

module AppName
  class Handlers
    def self.process(event:)
      "Hello, #{event['data']['name']}, I'm from #{name}"
    end
  end
end

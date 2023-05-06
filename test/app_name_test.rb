# frozen_string_literal: true

require "test_helper"

describe AppName do
  it "application must be defined" do
    assert_kind_of Class, AppName::Application
    assert_kind_of Method, AppName::Application.method(:call)
  end
end

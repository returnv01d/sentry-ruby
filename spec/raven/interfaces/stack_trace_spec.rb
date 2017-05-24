require 'spec_helper'

class TestInterface < Raven::Interface
  attr_accessor :some_attr
end

describe Raven::StacktraceInterface::Frame do
  it "should convert pathnames to strings" do
    frame = Raven::StacktraceInterface::Frame.new
    $:.unshift Pathname.pwd # Oh no, a Pathname in the $LOAD_PATH!
    frame.abs_path = __FILE__
    expect(frame.filename).to match(/stack_trace_spec.rb/)
    $:.shift
  end
end
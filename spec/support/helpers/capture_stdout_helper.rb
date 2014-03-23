require "stringio"

module Helpers
  def capture_stdout(&block)
    begin
      fake = StringIO.new
      eval("$stdout = fake")
      block.call
      fake.string
    ensure
      eval("$stdout = STDOUT")
    end
  end
end

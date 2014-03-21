require 'stringio'

module Helpers
  def capture(stream)
    begin
      fake = StringIO.new
      eval("$#{stream} = fake")
      yield
      fake.string
    ensure
      eval("$#{stream} = #{stream.upcase}")
    end
  end
end

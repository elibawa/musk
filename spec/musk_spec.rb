require 'spec_helper'

describe Musk do
  describe '.hi' do
    it 'should return "Hello world!"' do
      Musk.hi.should eq("Hello world!")
    end
  end
end

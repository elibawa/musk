guard "rspec" do
  watch(%r{^lib/(.+).rb$}) do |match|
    "spec/lib/#{match[1]}_spec.rb"
  end

  watch(%r{^spec/(.+).rb$}) do |match|
    "spec/#{match[1]}.rb"
  end
end

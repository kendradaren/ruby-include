require "colorize"
require "digest"
require "test/unit"

# require all files in tests
Dir.glob(File.join(".", "{tests}", "**", "*.rb"), &method(:require))

# will run all tests

require "colorize"
require "digest"

# require all files in modules and classes
Dir.glob(File.join(".", "{modules,classes}", "**", "*.rb"), &method(:require))

require "test/unit"

class TestEncryptionUtility < Test::Unit::TestCase
  def test_encypt_class_method
    # as EncryptionUtility extend by EncryptionSHA,
    # encrypt is available as a class method
    assert_nothing_raised(NoMethodError) {
      EncryptionUtility.encrypt("Test string")
    }
  end

  def test_encypt_instance_method_fail
    # as EncryptionUtility extend by EncryptionSHA,
    # encrypt is *not* available as an instance method
    assert_raise(NoMethodError) {
      e = EncryptionUtility.new
      e.encrypt("Test string")
    }
  end
end

require "colorize"
require "digest"

# require all files in modules and classes
Dir.glob(File.join(".", "{modules,classes}", "**", "*.rb"), &method(:require))

require "test/unit"

class TestPerson < Test::Unit::TestCase
  def test_initialize
    assert_not_nil(Person.new("TestPerson"))
  end

  def test_name_accessor
    expectedName = "TestPerson"
    p = Person.new(expectedName)
    assert_equal(expectedName, p.name)
  end

  def test_number_of_instances
    p1 = Person.new("TestPerson1")
    firstCount = Person.number_of_instances
    p2 = Person.new("TestPerson2")
    secondCount = Person.number_of_instances
    assert(secondCount == firstCount + 1)
  end

  def test_no_encrypt_instance_method
    p1 = Person.new("TestPerson1")

    # Person does not include EncryptionSHA, so no encrypt method
    assert_raise(NoMethodError) {
      p1.encrypt("Test String")
    }
  end

  def test_extend_instance_can_call_encrypt
    p1 = Person.new("TestPerson1")

    p1.extend(EncryptionSHA)

    # p1 will now have the encrypt instance method
    assert_nothing_raised() {
      p1.encrypt("Test string")
    }
  end

  def test_extend_instance_cannot_call_encrypt_password
    p1 = Person.new("TestPerson1")

    p1.extend(EncryptionSHA)

    # p1 call to encrypt_password fails as is missing @password
    assert_raise(TypeError) {
      p1.encrypt_password
    }
  end

  def test_extend_only_instance_can_call_encrypt
    p1 = Person.new("TestPerson1")
    p2 = Person.new("TestPerson2")

    p1.extend(EncryptionSHA)

    # p2 will not have the encrypt instance method as only p1 is extended
    assert_raise(NoMethodError) {
      p2.encrypt("Test string")
    }
  end

  def test_extend_class_cannot_call_encrypt
    p1 = Person.new("TestPerson1")

    p1.extend(EncryptionSHA)

    # p1 class call to encrypt fails as is missing @password
    assert_raise(NoMethodError) {
      p1.class.encrypt("Test string")
    }
  end

  def test_swap_extend_module_changes_encrypt
    p1 = Person.new("TestPerson1")

    p1.extend(EncryptionSHA)
    p1_sha_result = p1.encrypt("Test string")

    p1.extend(EncryptionMD5)
    p1_md5_result = p1.encrypt("Test string")

    assert_not_same(p1_sha_result, p1_md5_result)
  end
end

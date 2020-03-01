require "colorize"
require "digest"

# require all files in modules and classes
Dir.glob(File.join(".", "{modules,classes}", "**", "*.rb"), &method(:require))

require "test/unit"

class TestUser < Test::Unit::TestCase
  def test_initialize
    assert_not_nil(User.new("TestPerson"))
  end

  def test_name_accessor
    expectedName = "TestPerson"
    u = User.new(expectedName)
    assert_equal(expectedName, u.name)
  end

  def test_number_of_instances
    u1 = User.new("TestPerson1")
    firstCount = User.number_of_instances
    u2 = User.new("TestPerson2")
    secondCount = User.number_of_instances
    assert(secondCount == firstCount + 1)
  end

  def test_password_set
    testPassword = "Test Password"
    u = User.new("TestPerson")
    u.password = testPassword
  end

  def test_include_module_encrypted_password
    testPassword = "Test Password"
    u = User.new("TestPerson")
    u.password = testPassword

    # encrypted_password works as include EncryptionSHA
    result = u.encrypted_password
    assert_not_nil(result)
  end

  def test_include_module_encrypt
    testPassword = "Test Password"
    u = User.new("TestPerson")
    u.password = testPassword

    # encrypt works as include EncryptionSHA
    result = u.encrypt(testPassword)
    assert_not_nil(result)
  end

  def test_include_module_encrypt_password
    testPassword = "Test Password"
    u = User.new("TestPerson")
    u.password = testPassword

    # encrypt_password works as include EncryptionSHA
    result = u.encrypt_password
    assert_not_nil(result)
  end

  def test_swap_extend_module_changes_encrypt
    testPassword = "Test Password"
    u = User.new("TestPerson")
    u.password = testPassword

    u_sha_result = u.encrypt_password

    # overwrite the encrypt methods
    u.extend(EncryptionMD5)
    u_md5_result = u.encrypt("Test string")

    assert_not_same(u_sha_result, u_md5_result)
  end
end

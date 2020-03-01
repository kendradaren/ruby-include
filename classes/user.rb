class User < Person
  include EncryptionSHA

  @number_of_instances = 0

  def password=(password)
    @password = password
  end

  def encrypted_password
    encrypt(@password)
  end
end

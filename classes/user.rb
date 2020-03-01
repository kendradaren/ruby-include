class User < Person
  include EncryptionSHA

  def password=(password)
    @password = password
  end

  def encrypted_password
    encrypt(@password)
  end
end

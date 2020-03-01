module EncryptionSHA
  def self.included(base)
    puts "#{base} included #{self}".yellow
  end

  def self.extended(base)
    puts "#{base} extended #{self}".green
  end

  def encrypt(string)
    Digest::SHA2.hexdigest(string)
  end

  # this will fail if the object/class does not have @password
  def encrypt_password
    Digest::SHA2.hexdigest(@password)
  end
end

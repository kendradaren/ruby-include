require "digest"
require "colorize"

module EncryptionMD5
  def self.included(base)
    puts "#{base} included #{self}".yellow
  end

  def self.extended(base)
    puts "#{base} extended #{self}".green
  end

  def encrypt(string)
    Digest::MD5.hexdigest(string)
  end

  # this will fail if the object/class does not have @password
  def encrypt_password
    Digest::MD5.hexdigest(@password)
  end
end

require "colorize"
require "digest"

# require all files in modules and classes
Dir.glob(File.join(".", "{modules,classes}", "**", "*.rb"), &method(:require))

p Person.instance_count

person = Person.new("Anja")
p Person.instance_count
friend = Person.new("Carla")
p Person.instance_count
p friend.class.instance_count

user = User.new("Ada")
p User.instance_count
user.password = "super secret"
p user
p user.name
p "user.encrypted_password"
p user.encrypted_password
p "user.encrypt_password"
p user.encrypt_password
p user.class.instance_count

# A user instance can access encrypt as it is "included"
p user.encrypt("Hello Kendra")

# However, the User class does not have a class method for encrypt
# so neither of these work:

#p.user.class.encrypt("Hello Kendra")
#p User.encrypt("Hello Kendra")

# As the EncryptionUtility class is "extended" by EncryptionSHA,
# the methods of EncryptionSHA # are added as class methods to
# EncryptionUtility, so this works:
p EncryptionUtility.encrypt("Hello Kendra")

# However, the following cannot work
enc = EncryptionUtility.new
p enc.encrypt("Hello Kendra")

# you have to use
p enc.class.encrypt("Hello Kendra")

# this does not work
p person.encrypt("Hello Kendra")

# extend Encryption in just the person instance
person.extend(EncryptionSHA)
p person.encrypt("Hello Kendra")

# fails as person doesn't have a password
#p person.encrypt_password()

# this does not work as we only extended the person instance
p friend.encrypt("Hello Kendra")

# replace extend
person.extend(EncryptionMD5)
p person.encrypt("Hello Kendra")

# now just add a new method to the friend instance
friend.define_singleton_method(:print_name) do
  for i in 0..5
    # access the name accessor on the object
    # fails if no name
    p name
  end
end

friend.print_name

# does not work - print_name only on the friend instance
# person.print_name

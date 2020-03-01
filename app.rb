require "colorize"
require "digest"

# require all files in modules and classes
Dir.glob(File.join(".", "{modules,classes}", "**", "*.rb"), &method(:require))

puts "Test number_of_instances".light_magenta
p Person.number_of_instances

person = Person.new("Anja")
puts "Test number_of_instances".light_magenta
p Person.number_of_instances
friend = Person.new("Carla")
puts "Test number_of_instances".light_magenta
p Person.number_of_instances
puts "Test number_of_instances".light_magenta
p friend.class.number_of_instances

puts "Test create user".light_blue
user = User.new("Ada")
puts "Test number_of_instances".light_magenta
p User.number_of_instances
user.password = "super secret"
p user
p user.name

puts "user.encrypted_password".light_blue
p user.encrypted_password

puts "user.encrypt_password".light_blue
p user.encrypt_password
puts "Test number_of_instances".light_magenta
p user.class.number_of_instances

puts "A user instance can access encrypt as it is 'included'".light_blue
p user.encrypt("Hello Kendra")

# However, the User class does not have a class method for encrypt
# so neither of these work:

#p.user.class.encrypt("Hello Kendra")
#p User.encrypt("Hello Kendra")

# As the EncryptionUtility class is "extended" by EncryptionSHA,
# the methods of EncryptionSHA # are added as class methods to
# EncryptionUtility, so this works:

# p EncryptionUtility.encrypt("Hello Kendra")

# However, the following cannot work:

# enc = EncryptionUtility.new
# p enc.encrypt("Hello Kendra")

# you have to use
# p enc.class.encrypt("Hello Kendra")

# this does not work
# p person.encrypt("Hello Kendra")

# extend Encryption in just the person instance:

# person.extend(EncryptionSHA)
# p person.encrypt("Hello Kendra")

# this fails as person doesn't have a password
# p person.encrypt_password()

# this does not work as we only extended the person instance
# p friend.encrypt("Hello Kendra")

# replace extend
# person.extend(EncryptionMD5)
# p person.encrypt("Hello Kendra")

# now just add a new method to the friend instance
# friend.define_singleton_method(:print_name) do
#   for i in 0..5
#     # access the name accessor on the object
#     # fails if no name
#     p name
#   end
# end

# friend.print_name

# does not work - print_name only on the friend instance
# person.print_name

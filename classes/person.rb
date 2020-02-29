require_relative "../modules/encryption_sha"
require "colorize"

class Person
  @@number_of_instances = 0

  def method_missing(sym, *args)
    puts ">>>>>>>>>>>> #{sym} not defined on #{self}".red
  end

  def self.instance_count
    "Instances: " + @@number_of_instances.to_s
  end

  def initialize(name)
    @name = name
    @@number_of_instances += 1
  end

  def name
    @name
  end
end

class Person
  @@number_of_instances = 0

  def self.instance_count
    @@number_of_instances
  end

  def initialize(name)
    @name = name
    @@number_of_instances += 1
  end

  def name
    @name
  end
end

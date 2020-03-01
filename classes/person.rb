class Person
  @number_of_instances = 0

  def self.number_of_instances=(value)
    @number_of_instances = value
  end

  def self.number_of_instances
    @number_of_instances
  end

  def self.instance_count
    @number_of_instances
  end

  def initialize(name)
    @name = name
    self.class.number_of_instances += 1
  end

  def name
    @name
  end
end

class CreateCategory

  attr_reader :name

  def initialize(name)
    @name = name.freeze
  end

  def persist(repository)
    repository.persist('category', name)
  end

  def to_s
    name
  end

end

class CreateTask

  attr_reader :category
  attr_reader :message

  def initialize(category, message)
    @category = category
    @message = message
  end

  def persist
  end

end

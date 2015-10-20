require_relative 'create_category'

class TodoCLI
  
  attr_reader :command

  def initialize(command)
    @command = command
  end

  def execute!
    words = @command.split(" ")
    cmd = words.shift
    
    case cmd
      when 'new' then create_category words 
    else
      raise 'Invalid command!'
    end
  end

  private

  def create_category(split_command)
    raise 'Missing arguments!' if split_command.empty?

    CreateCategory.new(split_command.first).persist
  end

end

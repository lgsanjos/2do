require_relative '../rb/create_task'

describe CreateTask do

  it 'should create a task given a category and a message' do

    new_task = CreateTask.new("this-month", "Fix the bathroom's window.")
    new_task.hash.should_not be(nil)

    new_task.persist
  end
end


class TodoList
  
  attr_accessor :list_name
  attr_reader :tasks
  
  def initialize(name)
    @list_name = name  
    @tasks = Array.new
  end
  
  def add(name)
    task = Task.new(name)
    @tasks << task
  end
  
  def edit(index, name)
    task = @tasks[index]
    task.name = name
  end
  
  def remove(index)
    tasks.delete_at(index)
    return tasks #show the modified task list, not the deleted task
  end
  
  def complete(*indexes)
    indexes.each {|index| @tasks[index].done!}
  end
  
  def list
    puts "Your Tasks:"
    return "This Task List is empty" if @tasks.empty?
    
    @tasks.each do |task|
      puts "- #{task.name} [#{task.status}]"
    end
  end
  
end

class Task
  attr_accessor :name
  attr_reader :status
  
  def initialize(name)
    @name = name
    @status = "pending"
  end
  
  def done!
    @status = "completed"
  end
  
end 

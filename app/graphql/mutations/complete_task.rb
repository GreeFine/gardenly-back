class Mutations::CompleteTask < Mutations::BaseMutation
  argument :id, ID, required: true

  field :task, Types::TaskType, null: true

  def resolve(arguments)
    task = Task.find(arguments[:id])
    task.status = "Done"

    task.save!
    
  end
end
